CREATE TABLE [Test].[Taxonomy](
	[TaxonomyId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[AccountKey] [int] NOT NULL,
	[ParentTaxonomyKey] [int] NULL,
	[TaxonomyName] [varchar](100) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[TaxonomyDBID] [int] NULL,
	[Checksum] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TaxonomyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[Taxonomy]  WITH CHECK ADD  CONSTRAINT [FK_Taxonomy_Accounts] FOREIGN KEY([AccountKey])
REFERENCES [Account].[Accounts] ([AccountId])
GO

ALTER TABLE [Test].[Taxonomy] CHECK CONSTRAINT [FK_Taxonomy_Accounts]
GO
ALTER TABLE [Test].[Taxonomy] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_Taxonomy_AccountKey] ON [Test].[Taxonomy]
(
	[AccountKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Taxonomy_TaxonomyDBID] ON [Test].[Taxonomy]
(
	[TaxonomyDBID] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]