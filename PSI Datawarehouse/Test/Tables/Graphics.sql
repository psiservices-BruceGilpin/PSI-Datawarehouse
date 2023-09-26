CREATE TABLE [Test].[Graphics] (
    [GraphisId]          INT           IDENTITY (1, 1) NOT NULL,
    [GraphicsDBID]       INT           NOT NULL,
    [SourceSystemKey]    SMALLINT      NOT NULL,
    [SourceSystemID]     VARCHAR (20)  NOT NULL,
    [AccountKey]         INT           NOT NULL,
    [FileExtension]      VARCHAR (10)  NULL,
    [FileName]           VARCHAR (100) NULL,
    [ExhibitName]        VARCHAR (100) NULL,
    [ExhibitTypeKey]     INT           NOT NULL,
    [ExhibitCategoryKey] INT           NOT NULL,
    [CreateDate]         DATETIME      DEFAULT (getdate()) NOT NULL,
    [CurrentFlag]        BIT           DEFAULT ((0)) NOT NULL,
    [Checksum]           INT           NULL,
    PRIMARY KEY CLUSTERED ([GraphisId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Graphics_GraphicsDBKey]
    ON [Test].[Graphics]([GraphicsDBID] ASC) WHERE ([Currentflag]=(0));

