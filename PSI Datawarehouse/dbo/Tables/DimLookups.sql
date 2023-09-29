CREATE TABLE [dbo].[DimLookups] (
    [LookupsId]         INT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]   INT           NOT NULL,
    [SourceLookupValue] VARCHAR (50)  NOT NULL,
    [LookupName]        VARCHAR (50)  NULL,
    [Description]       VARCHAR (100) NULL,
    [CreateDate]        DATETIME      CONSTRAINT [dfCreateDateLookups] DEFAULT (getdate()) NULL,
    [CurrentFlag]       SMALLINT      CONSTRAINT [dfCurrentFlagLookups] DEFAULT ((0)) NULL,
    CONSTRAINT [PKLookupsId] PRIMARY KEY CLUSTERED ([LookupsId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_DimLookups_SourceLookupValue]
    ON [dbo].[DimLookups]([SourceLookupValue] ASC);

