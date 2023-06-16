CREATE TABLE [Test].[TestCatalogue](
	[TestCatalogueId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[SSTestCatalogueKey] [varchar](20) NOT NULL,
	[ParentCatalogueKey] [int] NULL,
	[CatalogueName] [varchar](100) NOT NULL,
	[CatalogueType] [smallint] NULL,
	[CatalogueDescription] [varchar](255) NULL,
	[AccountKey] [int] NOT NULL,
	[CountryKey] [smallint] NOT NULL,
	[State] [varchar](2) NULL,
	[GlobalTestCatalogueKey] [varchar](20) NOT NULL,
	[Checksum] [int] NOT NULL,
	[RunID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[TestCatalogueDBID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TestCatalogueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[TestCatalogue] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_TestCatalogue_AccountKey] ON [Test].[TestCatalogue]
(
	[AccountKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestCatalogue_TestCatalogueDBID] ON [Test].[TestCatalogue]
(
	[TestCatalogueDBID] ASC
)
WHERE ([currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]