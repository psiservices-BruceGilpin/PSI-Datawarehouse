CREATE TABLE [Test].[ItemPool] (
    [ItemPoolId]        INT             IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]   INT             NOT NULL,
    [PortionKey]        INT             NOT NULL,
    [ItemKey]           INT             NOT NULL,
    [MinWeightage]      DECIMAL (10, 6) NULL,
    [ItemWeightage]     DECIMAL (10, 6) NULL,
    [Pvalue]            DECIMAL (9, 4)  NULL,
    [Pbis]              DECIMAL (9, 4)  NULL,
    [AngoffValue]       DECIMAL (9, 4)  NULL,
    [IsRecorded]        BIT             NULL,
    [IsTimed]           BIT             NULL,
    [IsScored]          BIT             NULL,
    [ItemPoolStatusKey] INT             NULL,
    [IsFromQorNQ]       BIT             NULL,
    [ActiveIsg]         INT             NULL,
    [Subtopic]          VARCHAR (50)    NULL,
    [Checksum]          INT             NOT NULL,
    [CreatedDate]       DATETIME        DEFAULT (getdate()) NOT NULL,
    [CurentFlag]        BIT             DEFAULT ((0)) NOT NULL,
    [ItemPoolDBID]      INT             NULL,
    PRIMARY KEY CLUSTERED ([ItemPoolId] ASC),
    CONSTRAINT [FK_ItemPool_ItemBank] FOREIGN KEY ([ItemKey]) REFERENCES [Test].[ItemBank] ([ItemBankId]),
    CONSTRAINT [FK_ItemPool_TestPortion] FOREIGN KEY ([PortionKey]) REFERENCES [Test].[Portion] ([PortionId])
);


GO
CREATE NONCLUSTERED INDEX [IX_ItemPool_PortionKey]
    ON [Test].[ItemPool]([PortionKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ItemPool_ItemKey]
    ON [Test].[ItemPool]([ItemKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ItemPool_ItemPoolDBID]
    ON [Test].[ItemPool]([ItemPoolDBID] ASC) WHERE ([CurentFlag]=(0));

