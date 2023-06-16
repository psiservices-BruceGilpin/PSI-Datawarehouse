CREATE TABLE [Cisco].[AgentEventDetail](
	[AgentEventDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Time] [time](7) NULL,
	[AgentsKey] [int] NULL,
	[SourceSystemKey] [int] NULL,
	[MRDomainKey] [bigint] NULL,
	[TimeZone] [int] NULL,
	[LoginDate] [date] NULL,
	[LoginTime] [time](7) NULL,
	[Event] [int] NULL,
	[Duration] [int] NULL,
	[ReasonCodesKey] [bigint] NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[CheckSum] [int] NULL,
	[EffectiveTo] [datetime] NULL,
 CONSTRAINT [PKAgentEventDetailId] PRIMARY KEY NONCLUSTERED 
(
	[AgentEventDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[AgentEventDetail] ADD  CONSTRAINT [dfAgentEventEffectiveTo]  DEFAULT ('2999-12-31') FOR [EffectiveTo]
GO
CREATE CLUSTERED INDEX [CX_AgentEventDetail] ON [Cisco].[AgentEventDetail]
(
	[Date] ASC,
	[Time] ASC,
	[AgentsKey] ASC,
	[MRDomainKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]