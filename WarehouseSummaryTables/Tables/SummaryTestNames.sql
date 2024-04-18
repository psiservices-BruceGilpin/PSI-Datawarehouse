CREATE TABLE [Tests].[SummaryTestNames]
(
	[SummaryTestNamesDBID] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [CrossRefKey] int not null,
    [DimensionsTestKey] INT NOT NULL, 
    [SummaryTestName] VARCHAR(2000) NOT NULL, 
    [DimensionsAcctKey] int null,
    [AccountCode] Varchar(12),
    [Loaddate] DATETIME NOT NULL, 
    [CreateDate] DATETIME NOT NULL DEFAULT getdate(), 
    [Scalecut] INT NULL, 
    [RawCut] INT NULL, 
    [ItemCount] INT NULL

)

GO

CREATE INDEX [IX_SummaryTestNames_CrossRefKey] ON [Tests].[SummaryTestNames] ([CrossRefKey])
Include([DimensionsTestKey])

GO

CREATE INDEX [IX_SummaryTestNames_DimensionsTestKey] ON [Tests].[SummaryTestNames] ([DimensionsTestKey])
Include ([SummaryTestName])
