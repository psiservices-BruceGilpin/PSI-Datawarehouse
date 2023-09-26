CREATE PROCEDURE 
	[dbo].[uspUpdatePortionsRetakeCount]
	
AS
--Set Session Options
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

SET XACT_ABORT ON --Ensure all failed transactions are rolled back

SET NOCOUNT ON -- Suppress Record Count Messages

BEGIN TRY

	--Create and Index Temp table 
	IF OBJECT_ID('tempdb..##CanKeyTmp') IS NOT NULL
		DROP TABLE ##CanKeyTmp
	CREATE TABLE ##CanKeyTmp (CandidateKey BIGINT NOT NULL PRIMARY KEY CLUSTERED)

	--Insert CandidateKey into ##CanKeyTmp
	INSERT INTO 
		 ##CanKeyTmp
	SELECT DISTINCT
		a.CandidateKey
	FROM
		[PSI_Staging].[Staging].[StagingTestAssignments] a WITH (NOLOCK)
	WHERE
		a.CandidateKey <> 0  

	/*********************** Update Query******************************/
	;WITH
		rnk -- Get Number of Takes per candidate and portion
	AS
	(
	SELECT 
		a.CandidateKey, 
		b.testportionkey, 
		ISNULL(CAST(a.checkintime AS DATE), TestDate) tdate,  
		ROW_NUMBER() OVER(PARTITION BY a.candidatekey, b.testPortionKey ORDER BY ISNULL(CAST(a.checkintime AS DATE), TestDate) DESC) rnk
	FROM
		Candidate.TestAssignments a WITH (NOLOCK)
	INNER JOIN
		Candidate.TestAssignmentPortions b WITH (NOLOCK)
	ON
		a.TestAssignmentDBID = b.TestAssignKey 
	INNER JOIN	
		##CanKeyTmp c
	ON
		a.CandidateKey = c.CandidateKey
	WHERE 
		a.CandidateKey <> 0 AND a.CurrentFlag = 0 AND b.CurrentFlag = 0 
	)
	UPDATE
		Candidate.TestAssignmentPortions
	SET 
		Take# = c.rnk
	FROM
		Candidate.TestAssignments a WITH (NOLOCK)
	INNER JOIN	
		Candidate.TestAssignmentPortions b WITH (NOLOCK)
	ON
		a.TestAssignmentDBID = b.TestAssignKey 
	INNER JOIN
		rnk c
	ON
		a.CandidateKey = c.CandidateKey AND b.TestPortionKey = c.TestPortionKey AND ISNULL(CAST(a.checkintime AS DATE), TestDate) = tdate
	INNER JOIN	
		##CanKeyTmp d
	ON
		a.CandidateKey = d.CandidateKey
END TRY

BEGIN CATCH

   IF @@trancount > 0 ROLLBACK TRANSACTION

	INSERT INTO 
		[Logging].[SQLErrors] 
	(
		ErrorNumber,
		ErrorSeverity,
		ErrorState,
		ErrorProcedure,
		ErrorLine,
		ErrorMessage,
		ErrorDateTime
	)
	VALUES 
	(
		ERROR_NUMBER(),ERROR_SEVERITY(),ERROR_STATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE(),GETDATE()
	)

END CATCH