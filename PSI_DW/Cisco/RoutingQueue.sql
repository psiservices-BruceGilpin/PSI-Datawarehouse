CREATE TABLE [Cisco].[RoutingQueue](
	[RoutingQueueID] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemQueueKey] [int] NULL,
	[SourceSystemKey] [int] NULL,
	[QueueName] [varchar](75) NULL,
	[QueueType] [smallint] NULL,
	[TransferQueue] [smallint] NULL,
	[IsDeleted] [char](1) NULL,
	[ChatAttachmentEnabled] [smallint] NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[CheckSum] [int] NULL,
	[EffectiveTo] [datetime] NULL,
 CONSTRAINT [PKRoutingQueueID] PRIMARY KEY CLUSTERED 
(
	[RoutingQueueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[RoutingQueue] ADD  CONSTRAINT [dfEffectiveToRoutingQueue]  DEFAULT ('2099/12/31') FOR [EffectiveTo]
GO
CREATE NONCLUSTERED INDEX [IX_RoutingQueue_SourceSystemQueueKey] ON [Cisco].[RoutingQueue]
(
	[SourceSystemQueueKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]