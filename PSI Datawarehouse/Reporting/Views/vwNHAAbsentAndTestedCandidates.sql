/**************************************************
CREATED BY: William Davis
CREATED ON: 4/28/2022
SYSTEM OF ORIGIN: PSI_DB
DESC:
	Creates list of Absent and Tested Candidates Associated with NHA

***************************************************/
CREATE VIEW
	[Reporting].[vwNHAAbsentAndTestedCandidates]
AS
SELECT 
	 [BookingCode]
	,[TestedStatus]
	,[TestDate]
	,[TestName]
	,[TestCenterName]
	,[City]
	,[State]
	,[Country]
FROM 
	[Reporting].[NHAAbsentAndTestedCandidates]