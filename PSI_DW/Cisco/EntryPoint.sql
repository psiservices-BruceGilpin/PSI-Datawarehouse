CREATE TABLE [Cisco].[EntryPoint](
	[EntryPointID] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemEntryPointKey] [int] NULL,
	[SourceSystemKey] [int] NULL,
	[EntryPointName] [varchar](45) NULL,
	[OriginalQueueKey] [int] NULL,
	[OriginalQueueName] [varchar](47) NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[CheckSum] [int] NULL,
	[EffectiveTo] [datetime] NULL,
 CONSTRAINT [PKEntryPointID] PRIMARY KEY CLUSTERED 
(
	[EntryPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[EntryPoint] ADD  CONSTRAINT [dfEntryPointEffectiveTo]  DEFAULT ('2999-12-31') FOR [EffectiveTo]
GO
CREATE NONCLUSTERED INDEX [IX_EntryPoint_SourceSystemEntryPointKey] ON [Cisco].[EntryPoint]
(
	[SourceSystemEntryPointKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]