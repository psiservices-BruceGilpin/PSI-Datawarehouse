CREATE TABLE [Staging].[StagingRPProcessingTimes](
	[OrganizationKey] [int] NULL,
	[EventStepsKey] [int] NULL,
	[CandidateXRefKey] [bigint] NULL,
	[Date] [date] NULL,
	[EventAssigningIdx] [bigint] NULL,
	[EventAssigningStartTime] [datetime] NULL,
	[EventStartedIdx] [bigint] NULL,
	[EventStartedTime] [datetime] NULL,
	[IdxDiff] [bigint] NULL,
	[TotalTimeSeconds] [int] NULL,
	[TotalTimeMin] [float] NULL,
	[ProcessingMonth] [int] NULL,
	[ProcessingDay] [int] NULL,
	[Checksum] [int] NOT NULL,
	[RunDate] [datetime] NULL,
	[RunID] [int] NOT NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [CX_StagingRPProcessingTimes] ON [Staging].[StagingRPProcessingTimes]
(
	[OrganizationKey] ASC,
	[EventStepsKey] ASC,
	[CandidateXRefKey] ASC,
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]