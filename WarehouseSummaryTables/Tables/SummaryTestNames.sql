CREATE TABLE [Tests].[SummaryTestNames]
(
	[SummaryTestNamesDBID] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [DimensionsTestKey] INT NOT NULL, 
    [SummaryTestName] VARCHAR(2000) NOT NULL, 
    [AccountCode] Varchar(12),
    [CreateDate] DATETIME NOT NULL DEFAULT getdate(), 
    [Scalecut] INT NULL, 
    [RawCut] INT NULL 

)

GO

CREATE INDEX [IX_SummaryTestNames_DimensionsTestKey] ON [Tests].[SummaryTestNames] ([DimensionsTestKey])
Include ([SummaryTestName])
