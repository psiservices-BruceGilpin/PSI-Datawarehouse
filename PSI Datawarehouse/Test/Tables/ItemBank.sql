CREATE TABLE [Test].[ItemBank] (
    [ItemBankId]           INT             IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]      INT             NOT NULL,
    [SourceItemKey]        VARCHAR (20)    NOT NULL,
    [TaxonomyKey]          INT             NULL,
    [SourceItemID]         VARCHAR (20)    NOT NULL,
    [Stem]                 VARCHAR (5000)  NOT NULL,
    [ItemOwnershipKey]     TINYINT         NOT NULL,
    [MinWeightToConsider]  DECIMAL (10, 6) NULL,
    [MaxOptionsSelectable] SMALLINT        NULL,
    [AllowPartialScoring]  BIT             NULL,
    [CreatedDate]          DATETIME        DEFAULT (getdate()) NOT NULL,
    [CurrentFlag]          BIT             DEFAULT ((0)) NOT NULL,
    [CheckSum]             INT             NOT NULL,
    [ItemBankDBID]         INT             NULL,
    [PracticeItem]         BIT             NULL,
    PRIMARY KEY CLUSTERED ([ItemBankId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ItemBank_SourceItemKey]
    ON [Test].[ItemBank]([SourceItemKey] ASC, [SourceSystemKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ItemBank_ItemBankDBID]
    ON [Test].[ItemBank]([ItemBankDBID] ASC) WHERE ([CurrentFlag]=(0));

