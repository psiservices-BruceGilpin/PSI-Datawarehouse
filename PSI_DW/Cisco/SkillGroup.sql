CREATE TABLE [Cisco].[SkillGroup](
	[SkillGroupId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSkillTargetKey] [int] NULL,
	[PrceisionQueueKey] [int] NULL,
	[SourceSystemKey] [int] NULL,
	[PeripheralID] [smallint] NULL,
	[EnterpriseName] [varchar](50) NULL,
	[PeripheralNumber] [int] NULL,
	[PeripheralName] [varchar](50) NULL,
	[AvailableHoldoffDelay] [smallint] NULL,
	[Priority] [smallint] NULL,
	[BaseSkillTargetID] [int] NULL,
	[IsDeleted] [char](1) NULL,
	[MRDomainID] [int] NULL,
	[IPTA] [char](1) NULL,
	[DefaultEntry] [int] NULL,
	[UserDeletable] [char](1) NULL,
	[ServiceLevelThreshold] [int] NULL,
	[ServiceLevelType] [smallint] NULL,
	[ChangeStamp] [int] NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[CheckSum] [int] NULL,
	[EffectiveTo] [datetime] NULL,
 CONSTRAINT [PKSkillGroupId] PRIMARY KEY CLUSTERED 
(
	[SkillGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[SkillGroup] ADD  CONSTRAINT [dfSkillGroupEffectiveTo]  DEFAULT ('2999-12-31') FOR [EffectiveTo]
GO
CREATE NONCLUSTERED INDEX [IX_SkillGroup_SourceSkillTargetKey_PrceisionQueueKey] ON [Cisco].[SkillGroup]
(
	[SourceSkillTargetKey] ASC,
	[PrceisionQueueKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]