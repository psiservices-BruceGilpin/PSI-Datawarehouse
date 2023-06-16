CREATE TABLE [Cisco].[ActivitySnapshot](
	[ActivitySnapshotID] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Time] [time](7) NULL,
	[SourceSystemKey] [int] NULL,
	[EntryPointKey] [int] NULL,
	[AgentsKey] [int] NULL,
	[CustomerKey] [bigint] NULL,
	[ActivityID] [int] NULL,
	[CaseID] [int] NULL,
	[ReferrerURLID] [int] NULL,
	[ReferrerURLName] [varchar](26) NULL,
	[DeptID] [int] NULL,
	[DeptName] [varchar](27) NULL,
	[AbandonDateTime] [bigint] NULL,
	[FirstPickupDateTime] [bigint] NULL,
	[CustomerExitDateTime] [bigint] NULL,
	[AssignedUserExitDateTime] [bigint] NULL,
	[CompletionDateTime] [bigint] NULL,
	[WaitTime] [int] NULL,
	[ChatDuration] [int] NULL,
	[FollupUpEmailSent] [varchar](23) NULL,
	[ActivityPriority] [smallint] NULL,
	[ChatTopic] [varchar](1054) NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[CheckSum] [int] NULL,
	[EffectiveTo] [datetime] NULL,
 CONSTRAINT [PKActivitySnapshotID] PRIMARY KEY NONCLUSTERED 
(
	[ActivitySnapshotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[ActivitySnapshot] ADD  CONSTRAINT [dfActivitySnapshotEffectiveTo]  DEFAULT ('2999-12-31') FOR [EffectiveTo]
GO
CREATE CLUSTERED INDEX [CX_ActivitySnapshot_Column] ON [Cisco].[ActivitySnapshot]
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ActivitySnapshot_Column_Keys] ON [Cisco].[ActivitySnapshot]
(
	[EntryPointKey] ASC,
	[AgentsKey] ASC,
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]