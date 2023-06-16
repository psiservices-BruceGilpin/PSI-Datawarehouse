CREATE TABLE [Summary].[ItemResponseAnalysis](
	[ItemResponseAnalysisId] [bigint] IDENTITY(1,1) NOT NULL,
	[PortionName] [varchar](100) NOT NULL,
	[ItemKey] [bigint] NOT NULL,
	[AsofDate] [date] NOT NULL,
	[ItemStatus] [int] NOT NULL,
	[nT] [int] NULL,
	[nY] [int] NULL,
	[SigmaX] [int] NULL,
	[SigmaSQX] [bigint] NULL,
	[SigmaY] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AsofDate] ASC,
	[ItemResponseAnalysisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemResponseAnalysis_FixedFormItem] ON [Summary].[ItemResponseAnalysis]
(
	[ItemKey] ASC
)
INCLUDE([AsofDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]