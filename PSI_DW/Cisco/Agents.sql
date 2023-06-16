CREATE TABLE [Cisco].[Agents](
	[AgentsID] [int] IDENTITY(1,1) NOT NULL,
	[SourceAgentKey] [int] NULL,
	[SourceSystemKey] [int] NULL,
	[FirstName] [varchar](65) NULL,
	[LastName] [varchar](65) NULL,
	[FullName] [varchar](130) NULL,
	[LoginName] [varchar](131) NULL,
	[IsDeleted] [char](1) NULL,
	[IsTempAgent] [char](1) NULL,
	[IsSupervisorAgent] [char](1) NULL,
	[PeripheralID] [smallint] NULL,
	[PeripheralNumber] [varchar](32) NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[EffectiveTo] [datetime] NULL,
	[CheckSum] [int] NULL,
	[AgentTeam] [varchar](32) NULL,
 CONSTRAINT [PKAgentsID] PRIMARY KEY CLUSTERED 
(
	[AgentsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[Agents] ADD  CONSTRAINT [dfAgentsEffectiveTo]  DEFAULT ('2999-12-31') FOR [EffectiveTo]
GO
CREATE NONCLUSTERED INDEX [IX_Agents_SourceAgentKey] ON [Cisco].[Agents]
(
	[SourceAgentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]