﻿/*****************************************************************
CREATED BY: William Davis
CREATED ON: 2/21/2022
USED BY:  PSI_DW_SSIS Packages - 00-Load_Base_Tables_PSI_DB
DESCRIPTION:
	Runs the CheckSumCalculation Stored Procedure for each table
EDITS:

*******************************************************************/

CREATE PROCEDURE
	[dbo].[uspRunCheckSumCalculation]

AS

--Set Session Options

SET XACT_ABORT ON --Ensure all failed transactions are rolled back

SET NOCOUNT ON -- Suppress Record Count Messages

--Update Packages

BEGIN TRY

DECLARE @TableNames TABLE (TableName NVARCHAR(100), TableID INT)  
  
-- Declare your array table variable  
DECLARE @MyArray TABLE (TempCol NVARCHAR(50), ArrayIndex INT IDENTITY(1,1) )  
  
-- Add values to your array table
INSERT INTO 
	@MyArray (TempCol)  
-- Selects all table names to be placed in an Array
SELECT 
	[TableName]   
FROM 
	[PSI_Staging].[Logging].[ChecksumConfig]
GROUP BY
	[TableName]

--SELECT * FROM @MyArray
  
DECLARE @IndexVar INT  
DECLARE @TotalCount INT  
DECLARE @CurIndexedTableID NVARCHAR(50)  
SET @IndexVar = 0  
SELECT @TotalCount= COUNT(*) FROM @MyArray  

WHILE @IndexVar < @TOTALCOUNT  

BEGIN  
    SELECT @IndexVar = @IndexVar + 1  
  
    -- Get value of current indexed Table ID from array table  
    SELECT @CurIndexedTableID = TempCol FROM @MYARRAY WHERE ArrayIndex = @IndexVar  

	--Execute CheckSumCalculation SP for each table in the array

		EXEC CheckSumCalculation  @CurIndexedTableID
    END  
 
  
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