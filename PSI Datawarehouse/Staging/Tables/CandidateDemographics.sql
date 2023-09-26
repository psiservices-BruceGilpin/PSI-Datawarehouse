CREATE TABLE [Staging].[CandidateDemographics] (
    [CandidateDemoGraphicId] INT           IDENTITY (1, 1) NOT NULL,
    [TestRegnID]             BIGINT        NOT NULL,
    [VariableID]             INT           NOT NULL,
    [VariableValue]          VARCHAR (150) NOT NULL,
    [LoadDate]               DATETIME      DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([CandidateDemoGraphicId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_CandidateDemographics_TestRengID]
    ON [Staging].[CandidateDemographics]([TestRegnID] ASC);

