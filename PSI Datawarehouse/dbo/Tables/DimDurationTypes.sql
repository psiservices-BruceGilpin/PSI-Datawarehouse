CREATE TABLE [dbo].[DimDurationTypes] (
    [DurationTypeId]  INT          IDENTITY (1, 1) NOT NULL,
    [TypeDescription] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([DurationTypeId] ASC)
);

