CREATE TABLE [Test].[Tests](
	[TestId] [int] IDENTITY(1,1) NOT NULL,
	[SourceTestKey] [varchar](20) NOT NULL,
	[SourceSystemKey] [int] NULL,
	[TestName] [varchar](100) NOT NULL,
	[TestDescription] [varchar](255) NULL,
	[CategoryKey] [int] NOT NULL,
	[AccountKey] [int] NOT NULL,
	[IVRTestName] [varchar](200) NULL,
	[MarketSegment] [varchar](6) NULL,
	[ClientCode] [varchar](50) NULL,
	[GlobalTestID] [varchar](20) NOT NULL,
	[TestCreationDate] [date] NULL,
	[ContentType] [varchar](20) NULL,
	[ExamID] [varchar](50) NULL,
	[ApiToken] [varchar](255) NULL,
	[Checksum] [int] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[RunID] [int] NOT NULL,
	[TestStatusKey] [smallint] NULL,
	[TestTypeKey] [smallint] NULL,
	[TestDBKey] [int] NULL,
	[CurrentFlag] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[Tests]  WITH NOCHECK ADD  CONSTRAINT [FK_Tests_TestCategory] FOREIGN KEY([CategoryKey])
REFERENCES [Test].[TestCategory] ([TestCategoryId])
GO

ALTER TABLE [Test].[Tests] CHECK CONSTRAINT [FK_Tests_TestCategory]
GO
ALTER TABLE [Test].[Tests] ADD  CONSTRAINT [dfTestsCreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [Test].[Tests] ADD  CONSTRAINT [dfTestsCurrentFlag]  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_Tests_SourceTestKey] ON [Test].[Tests]
(
	[SourceTestKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Tests_TestDBKey] ON [Test].[Tests]
(
	[TestDBKey] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]