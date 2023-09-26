CREATE TABLE [dbo].[DimDurationDefinitions] (
    [DurationDefId]   INT           IDENTITY (1, 1) NOT NULL,
    [DurationName]    VARCHAR (100) NOT NULL,
    [OrganizationKey] INT           NOT NULL,
    [StartStepKey]    INT           NOT NULL,
    [CompleteStepKey] INT           NOT NULL,
    [CompletionState] VARCHAR (10)  NULL,
    [OneStepFlag]     BIT           NULL,
    [EffectiveFrom]   DATE          DEFAULT (getdate()) NOT NULL,
    [EffectiveTo]     DATE          DEFAULT ('2999/12/31') NOT NULL
);

