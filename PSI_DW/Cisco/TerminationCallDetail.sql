CREATE TABLE [Cisco].[TerminationCallDetail](
	[TerminationCallDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[MRDomainKey] [bigint] NULL,
	[SourceSystemKey] [int] NULL,
	[AgentsKey] [int] NULL,
	[SkillGroupKey] [bigint] NULL,
	[CallTypeKey] [int] NULL,
	[WrapUpDataKey] [int] NULL,
	[CallTypeQueueKey] [int] NULL,
	[PrecisionQueueKey] [int] NULL,
	[RouterCallKey] [int] NULL,
	[Date] [date] NULL,
	[Time] [time](7) NULL,
	[CallTypeDate] [date] NULL,
	[CallTypeTime] [time](7) NULL,
	[StartDateUTC] [date] NULL,
	[StartTimeUTC] [time](7) NULL,
	[TimeZone] [int] NULL,
	[PeripheralID] [smallint] NULL,
	[ANI] [varchar](52) NULL,
	[RouterCallKeyDay] [int] NULL,
	[PeripheralCallType] [smallint] NULL,
	[DigitsDialed] [varchar](40) NULL,
	[PeripheralCallKey] [int] NULL,
	[NetworkTime] [int] NULL,
	[Duration] [int] NULL,
	[RingTime] [int] NULL,
	[DelayTime] [int] NULL,
	[TimeToAband] [int] NULL,
	[HoldTime] [int] NULL,
	[TalkTime] [int] NULL,
	[WorkTime] [int] NULL,
	[LocalQTime] [int] NULL,
	[ConferenceTime] [int] NULL,
	[Variable1] [varchar](40) NULL,
	[Variable2] [varchar](40) NULL,
	[Variable3] [varchar](40) NULL,
	[Variable4] [varchar](40) NULL,
	[NewTransaction] [char](1) NULL,
	[TrunkGroupID] [int] NULL,
	[DNIS] [varchar](32) NULL,
	[InstrumentPortNumber] [int] NULL,
	[AgentPeripheralNumber] [varchar](32) NULL,
	[ICRCallKey] [int] NULL,
	[ICRCallKeyParent] [int] NULL,
	[ICRCallKeyChild] [int] NULL,
	[AnsweredWithinServiceLevel] [char](1) NULL,
	[Priority] [smallint] NULL,
	[Trunk] [int] NULL,
	[SourceAgentPeripheralNumber] [varchar](32) NULL,
	[SourceAgentSkillTargetID] [int] NULL,
	[CallDispositionFlag] [int] NULL,
	[RouterCallKeySequenceNumber] [int] NULL,
	[CED] [varchar](30) NULL,
	[BadCallTag] [char](1) NULL,
	[ApplicationTaskDisposition] [int] NULL,
	[NetQTime] [int] NULL,
	[RoutedSkillGroupSkillTargetID] [int] NULL,
	[RoutedServiceSkillTargetID] [int] NULL,
	[RoutedAgentSkillTargetID] [int] NULL,
	[Originated] [char](1) NULL,
	[CallReferenceID] [varchar](32) NULL,
	[PstnTrunkGroupID] [varchar](32) NULL,
	[PstnTrunkGroupChannelNumber] [int] NULL,
	[NetworkSkillGroupQTime] [int] NULL,
	[ProtocolID] [int] NULL,
	[PrecisionQueueStepOrder] [int] NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[CheckSum] [int] NULL,
	[EffectiveTo] [datetime] NULL,
 CONSTRAINT [PKTerminationCallDetailID] PRIMARY KEY NONCLUSTERED 
(
	[TerminationCallDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[TerminationCallDetail] ADD  CONSTRAINT [dfTerminationCallDetailEffectiveTo]  DEFAULT ('2999-12-31') FOR [EffectiveTo]
GO
CREATE CLUSTERED INDEX [CX_TerminationCallDetail] ON [Cisco].[TerminationCallDetail]
(
	[RouterCallKey] ASC,
	[PeripheralCallKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TerminationCallDetail_Column_Keys] ON [Cisco].[TerminationCallDetail]
(
	[AgentsKey] ASC,
	[SkillGroupKey] ASC,
	[CallTypeKey] ASC,
	[CallTypeQueueKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]