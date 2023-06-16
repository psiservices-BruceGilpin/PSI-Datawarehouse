CREATE TABLE [Test].[TestCategory](
	[TestCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ParentCategoryKey] [int] NULL,
	[SourceSystemKey] [int] NOT NULL,
	[SourceTestCategoryKey] [varchar](20) NULL,
	[TestCategoryName] [varchar](75) NULL,
	[Checksum] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[RunID] [int] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[TestCategoryDBID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TestCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[TestCategory] ADD  CONSTRAINT [dfTestCategoryCurrentFlag]  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Test].[TestCategory] ADD  CONSTRAINT [dfTestCategoryCreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
CREATE NONCLUSTERED INDEX [IX_TestCategory_SourceTestCategoryKey] ON [Test].[TestCategory]
(
	[SourceTestCategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestCategory_TestCategoryDBID] ON [Test].[TestCategory]
(
	[TestCategoryDBID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]