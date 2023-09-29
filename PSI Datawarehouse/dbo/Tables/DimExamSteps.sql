CREATE TABLE [dbo].[DimExamSteps] (
    [ExamStepId] INT           IDENTITY (1, 1) NOT NULL,
    [StepName]   VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([ExamStepId] ASC)
);

