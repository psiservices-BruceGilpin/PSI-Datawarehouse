CREATE TABLE [Cisco].[MRDomain](
	[MRDomainId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSytemMRDomainKey] [int] NULL,
	[SourceSystemKey] [int] NULL,
	[MediaClassID] [int] NULL,
	[EnterpriseName] [varchar](32) NULL,
	[Description] [varchar](100) NULL,
	[Interruptible] [char](1) NULL,
	[TaskLife] [int] NULL,
	[TaskStartTimeout] [int] NULL,
	[ServiceLevelThreshold] [int] NULL,
	[ServiceLevelType] [smallint] NULL,
	[MaxTaskDuration] [int] NULL,
	[MaxCallsInQueue] [int] NULL,
	[MaxTimeInQueue] [int] NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[CheckSum] [int] NULL,
	[EffectiveTo] [datetime] NULL,
 CONSTRAINT [PKMRDomainId] PRIMARY KEY CLUSTERED 
(
	[MRDomainId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[MRDomain] ADD  CONSTRAINT [dfMRDomainEffectiveTo]  DEFAULT ('2999-12-31') FOR [EffectiveTo]
GO
CREATE NONCLUSTERED INDEX [IX_MRDomain_SourceSytemMRDomainKey] ON [Cisco].[MRDomain]
(
	[SourceSytemMRDomainKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]