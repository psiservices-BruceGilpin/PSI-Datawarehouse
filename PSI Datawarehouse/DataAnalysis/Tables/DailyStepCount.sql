CREATE TABLE [DataAnalysis].[DailyStepCount] (
    [DailyStepCountId] INT           IDENTITY (1, 1) NOT NULL,
    [OrgName]          VARCHAR (266) NULL,
    [StepDate]         DATE          NOT NULL,
    [StepKey]          INT           NOT NULL,
    [StepCount]        INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([DailyStepCountId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_DailyStepCount_StepDate]
    ON [DataAnalysis].[DailyStepCount]([StepKey] ASC, [StepDate] ASC);

