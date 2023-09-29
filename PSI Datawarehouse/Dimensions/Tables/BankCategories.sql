CREATE TABLE [Dimensions].[BankCategories] (
    [BankCategoryId]          BIGINT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]         SMALLINT         NOT NULL,
    [SourceBankCategoryID]    UNIQUEIDENTIFIER NOT NULL,
    [BankCategoryDBId]        BIGINT           NOT NULL,
    [CurrentFlag]             BIT              DEFAULT ((0)) NOT NULL,
    [BankGroupKey]            BIGINT           NOT NULL,
    [BankCategoryTitle]       VARCHAR (50)     NOT NULL,
    [BankCategoryDescription] VARCHAR (1000)   NULL,
    [BankCategoryReference]   VARCHAR (600)    NULL,
    [BankCategorySequence]    INT              NULL,
    [BanckCategoryStatus]     INT              NOT NULL,
    [CheckSum]                BIGINT           NOT NULL,
    [LoadDate]                DATETIME         DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([BankCategoryId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_BankCategories_BankCategoriesDBID]
    ON [Dimensions].[BankCategories]([BankCategoryDBId] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_BankCategories_BankGroupKey]
    ON [Dimensions].[BankCategories]([BankGroupKey] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_BankCategories_CategoryTitle]
    ON [Dimensions].[BankCategories]([BankCategoryTitle] ASC) WHERE ([Currentflag]=(0));

