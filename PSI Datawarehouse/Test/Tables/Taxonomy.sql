CREATE TABLE [Test].[Taxonomy] (
    [TaxonomyId]        INT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]   INT           NOT NULL,
    [SourceSystemID]    VARCHAR (20)  NOT NULL,
    [AccountKey]        INT           NOT NULL,
    [ParentTaxonomyKey] INT           NULL,
    [TaxonomyName]      VARCHAR (100) NOT NULL,
    [Code]              VARCHAR (20)  NOT NULL,
    [CreationDate]      DATETIME      NOT NULL,
    [CurrentFlag]       BIT           DEFAULT ((0)) NOT NULL,
    [TaxonomyDBID]      INT           NULL,
    [Checksum]          INT           NULL,
    PRIMARY KEY CLUSTERED ([TaxonomyId] ASC),
    CONSTRAINT [FK_Taxonomy_Accounts] FOREIGN KEY ([AccountKey]) REFERENCES [Account].[Accounts] ([AccountId])
);


GO
CREATE NONCLUSTERED INDEX [IX_Taxonomy_AccountKey]
    ON [Test].[Taxonomy]([AccountKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Taxonomy_TaxonomyDBID]
    ON [Test].[Taxonomy]([TaxonomyDBID] ASC) WHERE ([CurrentFlag]=(0));

