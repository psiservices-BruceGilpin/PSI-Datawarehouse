CREATE TABLE [Test].[Enumeration] (
    [EnumerationId]   INT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey] SMALLINT      NOT NULL,
    [SourceSystemID]  VARCHAR (20)  NOT NULL,
    [EnumType]        INT           NOT NULL,
    [EnumDescription] VARCHAR (70)  NULL,
    [EnumName]        VARCHAR (100) NULL,
    [EnumerationDBID] INT           NOT NULL,
    [CurrentFlag]     BIT           DEFAULT ((0)) NOT NULL,
    [CreateDate]      DATETIME      DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([EnumerationId] ASC)
);

