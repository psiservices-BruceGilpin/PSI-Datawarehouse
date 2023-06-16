CREATE TABLE [dbo].[DimTaxonomy](
	[TaxonomyId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[SourceSystemID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Code] [varchar](20) NULL,
	[Status] [int] NOT NULL,
	[ParentTaxonomyID] [int] NULL,
	[CreationDate] [datetime] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TaxonomyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimTaxonomy]  WITH CHECK ADD  CONSTRAINT [FK_DimTaxonomy_DimLookups] FOREIGN KEY([Status])
REFERENCES [dbo].[DimLookups] ([LookupsId])
GO

ALTER TABLE [dbo].[DimTaxonomy] CHECK CONSTRAINT [FK_DimTaxonomy_DimLookups]
GO
ALTER TABLE [dbo].[DimTaxonomy] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[DimTaxonomy] ADD  DEFAULT ((1)) FOR [CurrentFlag]