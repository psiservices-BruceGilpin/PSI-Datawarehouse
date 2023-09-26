CREATE TABLE [Test].[ItemOptions] (
    [ItemOptionId]               INT             IDENTITY (1, 1) NOT NULL,
    [SourceSystemItemOptionsKey] VARCHAR (20)    NOT NULL,
    [SourceSystemKey]            INT             NOT NULL,
    [ItemKey]                    INT             NOT NULL,
    [OptionOrder]                TINYINT         NOT NULL,
    [OptionText]                 VARCHAR (5000)  NOT NULL,
    [Weightage]                  DECIMAL (10, 6) NOT NULL,
    [CheckSum]                   INT             NOT NULL,
    [CreatedOn]                  DATETIME        DEFAULT (getdate()) NOT NULL,
    [Currentflag]                BIT             DEFAULT ((0)) NOT NULL,
    [ItemOptionsDBID]            INT             NULL,
    PRIMARY KEY CLUSTERED ([ItemOptionId] ASC),
    CONSTRAINT [FK_ItemOptions_ItemBank] FOREIGN KEY ([ItemKey]) REFERENCES [Test].[ItemBank] ([ItemBankId])
);


GO
CREATE NONCLUSTERED INDEX [IX_ItemOptions_ItemKey]
    ON [Test].[ItemOptions]([ItemKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ItemOptions_SourceSystemItemOptionsKey]
    ON [Test].[ItemOptions]([SourceSystemItemOptionsKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ItemOptions_ItemOptionsDBID]
    ON [Test].[ItemOptions]([ItemOptionsDBID] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_ItemOptions_CurrentFlag]
    ON [Test].[ItemOptions]([Currentflag] ASC, [Weightage] ASC);

