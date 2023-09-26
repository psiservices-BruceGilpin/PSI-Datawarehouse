CREATE TABLE [Test].[ItemAccountXRef] (
    [ItemAccountXRefId] INT      IDENTITY (1, 1) NOT NULL,
    [AccountKey]        BIGINT   NOT NULL,
    [ItemKey]           BIGINT   NOT NULL,
    [LoadDate]          DATETIME DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ItemAccountXRefId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ItemAccountXRef_Account]
    ON [Test].[ItemAccountXRef]([AccountKey] ASC)
    INCLUDE([ItemKey]);


GO
CREATE NONCLUSTERED INDEX [IX_ItemAccountXRef_ItemKey]
    ON [Test].[ItemAccountXRef]([ItemKey] ASC)
    INCLUDE([AccountKey]);

