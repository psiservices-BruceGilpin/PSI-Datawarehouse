CREATE TABLE [Tests].[TestScoreSummary]
(
	[TestScoreSummaryId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [AccountCode]   Varchar(12) NULL,
    [TestTitle] VARCHAR(2000) NOT NULL, 
    [AsOfDate] DATE NOT NULL, 
    [TotalScore] INT NULL, 
    [AvgScore] INT NULL, 
    [TotalN] INT NULL, 
    [TotalPass] INT NULL, 
    [TotalPassRate] Decimal(6,3),
    [TotalFirstTimeN] INT NULL, 
    [TotalFirstTimePass] INT NULL, 
    [TotalFirstTimePassRate] decimal(6,3),
    [TotalVariance] DECIMAL(10, 3) NULL, 
    [TotalSD] DECIMAL(10, 3) NULL, 
    [Loaddatetime] DATETIME NOT NULL DEFAULT getdate()
)

GO

CREATE INDEX [IX_TestScoreSummary_CrossRefKey] ON [Tests].[TestScoreSummary] ([TestTitle])
Include (asofdate)
