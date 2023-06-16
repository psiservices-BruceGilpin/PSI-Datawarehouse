CREATE TABLE [Staging].[StagingNHARPData](
	[CandidateAltKey] [varchar](255) NULL,
	[BookingCode] [varchar](20) NULL,
	[GlobalScheduleID] [varchar](20) NULL,
	[Exam] [varchar](100) NULL,
	[ScheduleStatus] [varchar](70) NULL,
	[Result] [varchar](20) NULL,
	[TestCenter] [varchar](100) NULL,
	[ScheduledStartDatePST] [date] NULL,
	[ScheduledStartTimePST] [datetimeoffset](0) NULL,
	[TestLaunchDatePST] [datetime] NULL,
	[ScheduleStartvsActualStartMins] [int] NULL,
	[OpenFireDuration] [int] NULL,
	[RunID] [int] NULL,
	[RunDate] [datetime] NULL,
	[CheckSum] [int] NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [CX_StagingNHARPData] ON [Staging].[StagingNHARPData]
(
	[BookingCode] ASC,
	[GlobalScheduleID] ASC,
	[Exam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]