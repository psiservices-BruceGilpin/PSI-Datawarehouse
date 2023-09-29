CREATE TABLE [Dimensions].[BankCategoryGroups] (
    [BankCategoryGroupId]   BIGINT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]       SMALLINT         NOT NULL,
    [SourceBankCatGroupID]  UNIQUEIDENTIFIER NOT NULL,
    [BankCategoryGroupDBID] BIGINT           NOT NULL,
    [CurrentFlag]           BIT              DEFAULT ((0)) NOT NULL,
    [BankKey]               BIGINT           NOT NULL,
    [BankCatGroupTitle]     VARCHAR (50)     NOT NULL,
    [BankCatGroupDesc]      VARCHAR (600)    NULL,
    [GroupTag]              VARCHAR (50)     NULL,
    [PreTest]               BIT              NOT NULL,
    [BankCatGroupSequence]  INT              NULL,
    [BankCatStatus]         BIT              NOT NULL,
    [Checksum]              BIGINT           NOT NULL,
    [LoadDate]              DATETIME         DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([BankCategoryGroupId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_BankCategoryGroups_BankCategoryKey]
    ON [Dimensions].[BankCategoryGroups]([BankKey] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_BankCategoryGroups_CategoryGroupDBID]
    ON [Dimensions].[BankCategoryGroups]([BankCategoryGroupDBID] ASC)
    INCLUDE([BankCatGroupTitle]) WHERE ([CurrentFlag]=(0));

