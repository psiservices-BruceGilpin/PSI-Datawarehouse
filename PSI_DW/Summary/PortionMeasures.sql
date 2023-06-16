CREATE TABLE [Summary].[PortionMeasures](
	[PassRateId] [bigint] IDENTITY(1,1) NOT NULL,
	[TestPortionKey] [bigint] NOT NULL,
	[PortionName] [varchar](100) NOT NULL,
	[AllCandidatePassRate] [decimal](10, 3) NULL,
	[AllCandidateN] [decimal](10, 3) NULL,
	[AllCandidatePass] [int] NULL,
	[FirstTimeN] [int] NULL,
	[FirstTimePass] [int] NULL,
	[FirstTimePassRate] [decimal](10, 3) NULL,
	[AsOfDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PassRateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Summary].[PortionMeasures] ADD  DEFAULT (getdate()) FOR [AsOfDate]
GO
CREATE NONCLUSTERED INDEX [IX_PassRates_TestPortionName] ON [Summary].[PortionMeasures]
(
	[PortionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PortionMeasures_TestPortionKey] ON [Summary].[PortionMeasures]
(
	[TestPortionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]