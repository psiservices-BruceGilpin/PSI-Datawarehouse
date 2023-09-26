CREATE TABLE [Test].[GroupItems] (
    [GroupItemsId]           BIGINT       IDENTITY (1, 1) NOT NULL,
    [GroupItemsDBID]         BIGINT       NOT NULL,
    [CurrentFlag]            BIT          DEFAULT ((0)) NOT NULL,
    [SourceSystemKey]        SMALLINT     NOT NULL,
    [SouceSystemGroupItemID] VARCHAR (25) NOT NULL,
    [GroupInfoKey]           BIGINT       NOT NULL,
    [TopicAreaKey]           BIGINT       NOT NULL,
    [ItemBankKey]            BIGINT       NOT NULL,
    [TaxonomyKey]            BIGINT       NOT NULL,
    [CheckSum]               BIGINT       NOT NULL,
    [LoadDate]               DATETIME     DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([GroupItemsId] ASC)
);

