
CREATE VIEW
	[dbo].[tempCandidateData]
AS

SELECT  
	CTRI.SourceCandidateKey AS TestRegn_ID, 
	ctri.CandidateAltKey AS Candidate_ID, 
	--CTA.Candidate_ID_Type, 
	CTRI.FirstName AS FName,
	CTRI.LastName AS LName, 
	t.SourceTestKey AS Test_ID, 
	--CTRI.School_ID, 
	cts.SourceTestScheduleKey AS Schedule_ID, 
	CTA.TestDate AS [Date], 
	CTA.SourceTestAssignKey AS TestAssignment_ID, 
	tp.SourcePortionKey AS Portion_ID, 
	CTAP.result, 
	CTAP.rawscore AS Raw_Score, 
	CTAP.scaledscore AS Scaled_Score, 
	TP.PortionName AS Portion_Name, 
	TP.Rawcut AS Raw_cut, 
	TP.Scaledcut AS Scaled_cut, 
	CTAP.Take# AS Attempt, 
	CTA.SeatID, 
	T.TestName AS TestName, 
	a.SourceAccountID AS Account_ID
FROM 
	[Candidate].[TestAssignmentPortions] ctap WITH (NOLOCK)
INNER JOIN
	[Candidate].[TestAssignments] cta WITH (NOLOCK) ON ctap.TestAssignKey = cta.TestAssignmentDBID AND cta.CurrentFlag = 0
INNER JOIN
	[Candidate].[Candidates] ctri WITH (NOLOCK) ON cta.CandidateKey = ctri.CandidateDBId AND ctri.CurrentFlag = 0
INNER JOIN
	[Test].[Portion] tp WITH (NOLOCK) ON ctap.TestPortionKey = tp.PortionDBID AND tp.CurrentFlag = 0
INNER JOIN
	[Test].[Tests] t WITH (NOLOCK) ON tp.TestKey = t.TestDBKey AND t.CurrentFlag = 0
INNER JOIN
	[Account].[Accounts] a WITH (NOLOCK) ON t.AccountKey = a.AccountDBID AND a.CurrentFlag = 0
INNER JOIN
	[Candidate].[TestSchedule] cts WITH (NOLOCK) ON cta.TestScheduleKey = cts.CandidateTestScheduleDBID AND cts.CurrentFlag = 0
WHERE
	ctap.CurrentFlag = 0 AND tp.PortionTypeKey = 2
