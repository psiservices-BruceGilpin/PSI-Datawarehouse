CREATE TABLE [Summary].[ItemOptionAnalysis](
	[ItemOptionId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](50) NOT NULL,
	[ItemBankKey] [bigint] NOT NULL,
	[ItemOptionKey] [bigint] NOT NULL,
	[ItemStatusKey] [smallint] NOT NULL,
	[OptionOrder] [tinyint] NOT NULL,
	[nT] [int] NULL,
	[nY] [int] NULL,
	[SigmaX] [int] NULL,
	[SigmaSqX] [int] NULL,
	[SigmaY] [int] NULL,
	[SummaryYear] [int] NOT NULL,
	[SummaryWeek] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemOptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemOptionStats_ItembankKey] ON [Summary].[ItemOptionAnalysis]
(
	[ItemBankKey] ASC
)
INCLUDE([ItemOptionKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]