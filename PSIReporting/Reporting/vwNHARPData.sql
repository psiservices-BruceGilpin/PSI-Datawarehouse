/****** Object:  View [Reporting].[vwNHARPData]    Script Date: 6/16/2023 1:44:54 PM ******/

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
	[$(PSI_DW)].Reporting.[NHARPData]