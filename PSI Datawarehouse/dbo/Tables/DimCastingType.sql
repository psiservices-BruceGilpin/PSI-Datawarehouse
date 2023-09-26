CREATE TABLE [dbo].[DimCastingType] (
    [CastingTypeID]        INT          IDENTITY (1, 1) NOT NULL,
    [SourceCastingTypeKey] VARCHAR (20) NULL,
    [SourceSystemKey]      INT          NULL,
    [Description]          VARCHAR (70) NULL,
    CONSTRAINT [PKCastingTypeID] PRIMARY KEY CLUSTERED ([CastingTypeID] ASC)
);

