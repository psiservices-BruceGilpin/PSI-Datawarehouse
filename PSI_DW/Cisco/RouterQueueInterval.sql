CREATE TABLE [Cisco].[RouterQueueInterval](
	[RouterQueueIntervalID] [bigint] IDENTITY(1,1) NOT NULL,
	[DATE] [date] NULL,
	[Time] [time](7) NULL,
	[PrecisionQueueKey] [int] NULL,
	[SourceSystemKey] [int] NULL,
	[TimeZone] [int] NULL,
	[QueueCalls] [int] NULL,
	[CallsAbandQ] [int] NULL,
	[CallsOffered] [int] NULL,
	[CallsAbandToAgent] [int] NULL,
	[CallsDequeued] [int] NULL,
	[RouterError] [int] NULL,
	[ServiceLevel] [real] NULL,
	[ServiceLevelCalls] [int] NULL,
	[ServiceLevelRONA] [int] NULL,
	[ServiceLevelCallsOffered] [int] NULL,
	[ServiceLevelCallsAband] [int] NULL,
	[ServiceLevelCallsDequeue] [int] NULL,
	[ServiceLevelError] [int] NULL,
	[DelayQAbandTime] [int] NULL,
	[MaxCallsQueued] [int] NULL,
	[MaxCallWaitTime] [int] NULL,
	[CallsAbandDequeued] [int] NULL,
	[ReportingHalfHour] [int] NULL,
	[ReportingInterval] [int] NULL,
	[BucketIntervalID] [int] NULL,
	[RoutedToAgent] [int] NULL,
	[CallsAnswered] [int] NULL,
	[FutureUseInt1] [int] NULL,
	[FutureUseInt2] [int] NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[CheckSum] [int] NULL,
	[EffectiveTo] [datetime] NULL,
 CONSTRAINT [PKRouterQueueIntervalID] PRIMARY KEY NONCLUSTERED 
(
	[RouterQueueIntervalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[RouterQueueInterval] ADD  CONSTRAINT [dfRouterQueueIntervalEffectiveTo]  DEFAULT ('2999-12-31') FOR [EffectiveTo]
GO
CREATE CLUSTERED INDEX [CX_RouterQueueInterval] ON [Cisco].[RouterQueueInterval]
(
	[DATE] ASC,
	[Time] ASC,
	[PrecisionQueueKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]