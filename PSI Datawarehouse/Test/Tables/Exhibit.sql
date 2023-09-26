CREATE TABLE [Test].[Exhibit] (
    [ExhibitId]       INT          IDENTITY (1, 1) NOT NULL,
    [ExhibitDBID]     INT          NOT NULL,
    [SourceSystemKey] SMALLINT     NOT NULL,
    [SourceSystemID]  VARCHAR (20) NOT NULL,
    [ItemBankKey]     INT          NOT NULL,
    [IsDefault]       BIT          NULL,
    [DisplayWithItem] BIT          NULL,
    [CreateDate]      DATETIME     DEFAULT (getdate()) NOT NULL,
    [CurrentFlag]     BIT          DEFAULT ((0)) NOT NULL,
    [CheckSum]        INT          NULL,
    PRIMARY KEY CLUSTERED ([ExhibitId] ASC),
    CONSTRAINT [FK_Exhibit_ItemBank] FOREIGN KEY ([ItemBankKey]) REFERENCES [Test].[ItemBank] ([ItemBankId])
);


GO
CREATE NONCLUSTERED INDEX [IX_Exhibit_ItemKey]
    ON [Test].[Exhibit]([ItemBankKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Exhibit_ExhibitDBID]
    ON [Test].[Exhibit]([ExhibitDBID] ASC) WHERE ([CurrentFlag]=(0));

