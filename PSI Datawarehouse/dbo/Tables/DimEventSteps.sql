CREATE TABLE [dbo].[DimEventSteps] (
    [EventStepsID]   INT           IDENTITY (1, 1) NOT NULL,
    [EventAssigning] VARCHAR (255) NULL,
    [EventStarted]   VARCHAR (255) NULL,
    [Step]           VARCHAR (255) NULL,
    CONSTRAINT [PKEventStepsID] PRIMARY KEY CLUSTERED ([EventStepsID] ASC)
);

