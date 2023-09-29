/**************************************************
CREATED BY: William Davis
CREATED ON: 4/28/2022
SYSTEM OF ORIGIN: PSI_DB
DESC:
	Creates list of Absent and Tested Candidates Associated with NHA

***************************************************/
CREATE VIEW
	[Reporting].[vwNHARPData]
AS
SELECT 
	 [CandidateAltKey]
	,[BookingCode]
	,[GlobalScheduleID]
	,[Exam]
	,[ScheduleStatus]
	,[Result]
	,[TestCenter]
	,[ScheduledStartDatePST]
	,[ScheduledStartTimePST]
	,[TestLaunchDatePST]
	,[ScheduleStartvsActualStartMins]
	,[OpenFireDuration]
FROM 
	[Reporting].[NHARPData]