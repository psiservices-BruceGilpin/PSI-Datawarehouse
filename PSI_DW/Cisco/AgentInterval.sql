CREATE TABLE [Cisco].[AgentInterval](
	[AgentIntervalId] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Time] [time](7) NULL,
	[AgentsKey] [int] NULL,
	[SourceSystemKey] [int] NULL,
	[TimeZone] [int] NULL,
	[MRDomainKey] [bigint] NULL,
	[LoggedOnTime] [int] NULL,
	[AvailTime] [int] NULL,
	[NotReadyTime] [int] NULL,
	[TalkOtherTime] [int] NULL,
	[AvailableInMRDTime] [int] NULL,
	[RoutableInMRDTime] [int] NULL,
	[ReportingHalfHour] [int] NULL,
	[ReportingInterval] [int] NULL,
	[Extension] [int] NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[CheckSum] [int] NULL,
	[EffectiveTo] [datetime] NULL,
 CONSTRAINT [PKAgentIntervalId] PRIMARY KEY NONCLUSTERED 
(
	[AgentIntervalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[AgentInterval] ADD  CONSTRAINT [dfAgentIntervalEffectiveTo]  DEFAULT ('2999-12-31') FOR [EffectiveTo]
GO
CREATE CLUSTERED INDEX [CX_AgentInterval] ON [Cisco].[AgentInterval]
(
	[Date] ASC,
	[Time] ASC,
	[AgentsKey] ASC,
	[MRDomainKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]