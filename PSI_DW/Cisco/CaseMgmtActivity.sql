CREATE TABLE [Cisco].[CaseMgmtActivity](
	[CaseMgmtActivityID] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemActivityID] [bigint] NULL,
	[SourceSystemKey] [int] NULL,
	[UserKey] [bigint] NULL,
	[RoutingQueueKey] [bigint] NULL,
	[CaseID] [int] NULL,
	[ActivityMode] [smallint] NULL,
	[ActivityType] [smallint] NULL,
	[ActivitySubType] [smallint] NULL,
	[Status] [smallint] NULL,
	[SubStatus] [smallint] NULL,
	[Priority] [smallint] NULL,
	[CreatedOnDate] [date] NULL,
	[CreatedOnTime] [time](7) NULL,
	[ModifiedOnDate] [date] NULL,
	[ModifiedOnTime] [time](7) NULL,
	[DueDate] [date] NULL,
	[DueTime] [time](7) NULL,
	[Subject] [varchar](1024) NULL,
	[LanguageID] [smallint] NULL,
	[CustomerID] [int] NULL,
	[ContactPersonID] [int] NULL,
	[ContactPointID] [int] NULL,
	[Email] [varchar](1024) NULL,
	[LastReason] [varchar](200) NULL,
	[Pinned] [varchar](1) NULL,
	[Locked] [varchar](1) NULL,
	[FolderID] [int] NULL,
	[CreatedBy] [int] NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[CheckSum] [int] NULL,
	[EffectiveTo] [datetime] NULL,
 CONSTRAINT [PKCaseMgmtActivityID] PRIMARY KEY NONCLUSTERED 
(
	[CaseMgmtActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[CaseMgmtActivity] ADD  CONSTRAINT [dfEffectiveToCaseMgmtActivity]  DEFAULT ('2099/12/31') FOR [EffectiveTo]
GO
CREATE CLUSTERED INDEX [CX_CaseMgmtActivity] ON [Cisco].[CaseMgmtActivity]
(
	[SourceSystemActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CaseMgmtActivity_Keys] ON [Cisco].[CaseMgmtActivity]
(
	[UserKey] ASC,
	[RoutingQueueKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]