CREATE TABLE [FormPools].[DailyFormPoolSummary]
(
	[FormPoolSummaryId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [FormPoolKey] INT NOT NULL, 
    [FormPoolTopic] VARCHAR(128) NULL, 
    [FormPoolDescription] VARCHAR(512) NOT NULL, 
    [AsOfDate] DATE NOT NULL, 
    [TotalN] INT NULL, 
    [TotalPass] INT NULL, 
    [TotalFirstTimePass] INT NULL, 
    [PassRate] DECIMAL(8, 3) NULL, 
    [FirstTimePassRate] DECIMAL(8, 3) NULL, 
    [MeanFinalScore] DECIMAL(8, 3) NULL, 
    [StdDev] DECIMAL(8, 3) NULL, 
    [ReliablityEst] DECIMAL(8, 3) NULL, 
    [StdErrMean] DECIMAL(8, 3) NULL, 
    [TotalAllScores] INT NULL, 
    [TotalsqrAllScores] INT NULL
	
)

GO

CREATE INDEX [IX_DailyFormPoolSummary_FormPoolKey] ON [FormPools].[DailyFormPoolSummary] ([FormPoolKey])
