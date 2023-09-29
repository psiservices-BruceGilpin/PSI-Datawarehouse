CREATE TABLE [dbo].[DimExhibitType] (
    [ExhibitTypeID]        INT          IDENTITY (1, 1) NOT NULL,
    [SourceExhibitTypeKey] VARCHAR (20) NULL,
    [SourceSystemKey]      INT          NULL,
    [Description]          VARCHAR (70) NULL,
    CONSTRAINT [PKExhibitTypeID] PRIMARY KEY CLUSTERED ([ExhibitTypeID] ASC)
);

