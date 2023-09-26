CREATE TABLE [dbo].[DimExhibitCategory] (
    [ExhibitCategoryID]        INT          IDENTITY (1, 1) NOT NULL,
    [SourceExhibitCategoryKey] VARCHAR (20) NULL,
    [SourceSystemKey]          INT          NULL,
    [Description]              VARCHAR (70) NULL,
    CONSTRAINT [PKExhibitCategoryID] PRIMARY KEY CLUSTERED ([ExhibitCategoryID] ASC)
);

