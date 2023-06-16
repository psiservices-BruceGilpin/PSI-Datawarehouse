CREATE TABLE [Test].[PortionFormulaParameters](
	[FormulaParametersId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceFormulaParmeterID] [varchar](20) NOT NULL,
	[FormulaParametersDBID] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[CheckSum] [bigint] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[PortionKey] [bigint] NOT NULL,
	[scaling] [bit] NOT NULL,
	[scalex] [numeric](16, 12) NULL,
	[scaley] [numeric](16, 12) NULL,
	[Mean_Min_PValue] [numeric](7, 4) NULL,
	[Mean_Max_PValue] [numeric](7, 4) NULL,
	[StdDev_Min_PValue] [numeric](7, 4) NULL,
	[StdDev_Max_PValue] [numeric](7, 4) NULL,
	[Mean_Min_TValue] [numeric](8, 4) NULL,
	[Mean_Max_TValue] [numeric](8, 4) NULL,
	[StdDev_Min_TValue] [numeric](8, 4) NULL,
	[StdDev_Max_TValue] [numeric](8, 4) NULL,
	[Min_Target_Reliability] [numeric](7, 4) NULL,
	[Max_Target_Reliability] [numeric](18, 0) NULL,
	[PValue_N_cut] [numeric](5, 0) NULL,
	[Pbis_N_cut] [numeric](5, 0) NULL,
	[Date] [datetime] NULL,
	[Mean] [numeric](15, 4) NULL,
	[StdDev] [numeric](15, 4) NULL,
	[Reliability] [numeric](15, 4) NULL,
PRIMARY KEY CLUSTERED 
(
	[FormulaParametersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[PortionFormulaParameters] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Test].[PortionFormulaParameters] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
CREATE NONCLUSTERED INDEX [IX_PortionFormulaParameters_PortionKey] ON [Test].[PortionFormulaParameters]
(
	[PortionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]