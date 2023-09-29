CREATE TABLE [Test].[TestMap] (
    [TestMapId]    INT    IDENTITY (1, 1) NOT NULL,
    [TestKey]      BIGINT NOT NULL,
    [PortionKey]   BIGINT NOT NULL,
    [FixedFormKey] BIGINT NOT NULL,
    [ItemKey]      BIGINT NOT NULL,
    [StartDate]    DATE   NOT NULL,
    [EndDate]      DATE   NOT NULL,
    [LoadDate]     DATE   DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([TestMapId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_TestMap_TestKey]
    ON [Test].[TestMap]([TestKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TestMap_PortionKey]
    ON [Test].[TestMap]([PortionKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TestMap_ItemKey]
    ON [Test].[TestMap]([ItemKey] ASC);

