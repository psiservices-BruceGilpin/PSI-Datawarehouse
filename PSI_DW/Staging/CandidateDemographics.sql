CREATE TABLE [Staging].[CandidateDemographics]
(
	[CandidateDemoGraphicId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [TestRegnID] BIGINT NOT NULL, 
    [VariableID] INT NOT NULL, 
    [VariableValue] VARCHAR(150) NOT NULL, 
    [LoadDate] DATETIME NOT NULL DEFAULT getdate()
)

GO

CREATE INDEX [IX_CandidateDemographics_TestRengID] ON [Staging].[CandidateDemographics] ([TestRegnID])
