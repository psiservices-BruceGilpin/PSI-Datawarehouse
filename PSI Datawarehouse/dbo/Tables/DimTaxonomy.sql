CREATE TABLE [dbo].[DimTaxonomy] (
    [TaxonomyId]       INT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]  INT           NOT NULL,
    [SourceSystemID]   INT           NOT NULL,
    [Name]             VARCHAR (100) NOT NULL,
    [Code]             VARCHAR (20)  NULL,
    [Status]           INT           NOT NULL,
    [ParentTaxonomyID] INT           NULL,
    [CreationDate]     DATETIME      DEFAULT (getdate()) NOT NULL,
    [CurrentFlag]      BIT           DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([TaxonomyId] ASC),
    CONSTRAINT [FK_DimTaxonomy_DimLookups] FOREIGN KEY ([Status]) REFERENCES [dbo].[DimLookups] ([LookupsId])
);

