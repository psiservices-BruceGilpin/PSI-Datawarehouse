CREATE TABLE [Staging].[stage1RPProcessingTimes](
	[OrganizationName] [varchar](255) NULL,
	[pDiddy] [varchar](296) NULL,
	[EventAssigning] [varchar](255) NULL,
	[EventAssigningIdx] [bigint] NULL,
	[EventAssigningStartTime] [datetime] NULL,
	[EventStarted] [varchar](255) NULL,
	[EventStartedIdx] [bigint] NULL,
	[EventStartedTime] [datetime] NULL,
	[IdxDiff] [bigint] NULL,
	[TotalTimeSeconds] [int] NULL,
	[TotalTimeMin] [float] NULL,
	[ProcessingMonth] [int] NULL,
	[ProcessingDay] [int] NULL,
	[Step] [varchar](255) NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_stage1RPProcessingTimes_pDiddy] ON [Staging].[stage1RPProcessingTimes]
(
	[pDiddy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]