CREATE TABLE [Cisco].[PrecisionQueue](
	[PrecisionQueueID] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemPrecisionQueueKey] [int] NULL,
	[SourceSystemKey] [int] NULL,
	[EnterpriseName] [varchar](52) NULL,
	[Description] [varchar](62) NULL,
	[IsDeleted] [char](1) NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[CheckSum] [int] NULL,
	[EffectiveTo] [datetime] NULL,
	[ServiceLevelType] [smallint] NULL,
	[ServiceLevelThreshold] [int] NULL,
 CONSTRAINT [PKPrecisionQueueID] PRIMARY KEY CLUSTERED 
(
	[PrecisionQueueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[PrecisionQueue] ADD  CONSTRAINT [dfPrecisionQueueEffectiveTo]  DEFAULT ('2999-12-31') FOR [EffectiveTo]
GO
CREATE NONCLUSTERED INDEX [IX_PrecisionQueue_SourceSystemPrecisionQueueKey] ON [Cisco].[PrecisionQueue]
(
	[SourceSystemPrecisionQueueKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]