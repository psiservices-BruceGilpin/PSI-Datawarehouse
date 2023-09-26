CREATE TABLE [Test].[FixedFormItem] (
    [FixedFormItemId]    INT          IDENTITY (1, 1) NOT NULL,
    [FixedFormItemDBID]  INT          NOT NULL,
    [SourceFixedFormKey] INT          NOT NULL,
    [SourceItemID]       VARCHAR (20) NOT NULL,
    [FixedFormKey]       INT          NOT NULL,
    [ItemKey]            INT          NOT NULL,
    [Status]             INT          NULL,
    [CreatedDate]        DATETIME     DEFAULT (getdate()) NOT NULL,
    [CurrentFlag]        BIT          DEFAULT ((0)) NOT NULL,
    [Checksum]           INT          NULL,
    [DisplayOrder]       INT          NULL,
    [ISGType]            SMALLINT     NULL,
    PRIMARY KEY CLUSTERED ([FixedFormItemId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_FixedFormItem_ItemKey]
    ON [Test].[FixedFormItem]([ItemKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FixedFormItem_FixedFormKey]
    ON [Test].[FixedFormItem]([FixedFormKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FixedFormItem_FixedFormDBID]
    ON [Test].[FixedFormItem]([FixedFormItemDBID] ASC) WHERE ([Currentflag]=(0));

