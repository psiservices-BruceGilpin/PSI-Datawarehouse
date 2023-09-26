CREATE TABLE [Test].[TestCatalogueXref] (
    [TestCatalogXrefId]        INT          IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]          INT          NOT NULL,
    [SourceSystemTestKey]      VARCHAR (20) NOT NULL,
    [SourceSystemCatalogueKey] VARCHAR (20) NOT NULL,
    [CreatedDate]              DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([TestCatalogXrefId] ASC)
);

