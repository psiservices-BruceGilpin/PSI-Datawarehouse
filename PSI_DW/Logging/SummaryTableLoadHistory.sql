CREATE TABLE [Logging].[SummaryTableLoadHistory](
	[LoadHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](100) NOT NULL,
	[MinLoadDate] [datetime] NOT NULL,
	[LoadRefDate] [date] NULL,
	[MaxLoadDate] [datetime] NOT NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LoadHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Logging].[SummaryTableLoadHistory] ADD  DEFAULT ('01/01/1900') FOR [MinLoadDate]
GO
ALTER TABLE [Logging].[SummaryTableLoadHistory] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SummaryTableLoadHistory_TableName] ON [Logging].[SummaryTableLoadHistory]
(
	[TableName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]