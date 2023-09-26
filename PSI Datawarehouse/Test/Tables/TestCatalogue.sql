CREATE TABLE [Test].[TestCatalogue] (
    [TestCatalogueId]        INT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]        INT           NOT NULL,
    [SSTestCatalogueKey]     VARCHAR (20)  NOT NULL,
    [ParentCatalogueKey]     INT           NULL,
    [CatalogueName]          VARCHAR (100) NOT NULL,
    [CatalogueType]          SMALLINT      NULL,
    [CatalogueDescription]   VARCHAR (255) NULL,
    [AccountKey]             INT           NOT NULL,
    [CountryKey]             SMALLINT      NOT NULL,
    [State]                  VARCHAR (2)   NULL,
    [GlobalTestCatalogueKey] VARCHAR (20)  NOT NULL,
    [Checksum]               INT           NOT NULL,
    [RunID]                  INT           NOT NULL,
    [CreatedDate]            DATETIME      NOT NULL,
    [CurrentFlag]            BIT           DEFAULT ((0)) NOT NULL,
    [TestCatalogueDBID]      INT           NULL,
    PRIMARY KEY CLUSTERED ([TestCatalogueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_TestCatalogue_AccountKey]
    ON [Test].[TestCatalogue]([AccountKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TestCatalogue_TestCatalogueDBID]
    ON [Test].[TestCatalogue]([TestCatalogueDBID] ASC) WHERE ([currentflag]=(0));

