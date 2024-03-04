CREATE TABLE [Tests].[DailyTestSummary]
(
	[DailyTestSummaryId] BIGINT NOT NULL Identity(1,1) PRIMARY KEY, 
    [ClientCode] VARCHAR(16) NULL, 
    [TestTitle] VARCHAR(2000) NOT NULL, 
    [TestDate] DATE NOT NULL, 
    [ScaleCut] Int,
    [RawCut] int,
    [ItemCount] int,
    [DailyOther] INT NULL, 
    [DailyN] INT NULL, 
    [DailyFirstTimeN] Int Null,
    [DailyPass] INT NULL, 
    [DailyFirstTimePass] int Null,
    [DailyPassRate] DECIMAL(8, 3) NULL, 
    [DailyFirstTimePassRate] Decimal(8,3),
    [DailyMeanRawScore] Decimal(8,2),
    [DailyStdDev] Decimal(8,3),
    [DailyReliabilityEst] Decimal(9,3),
    [DailyStdErrMean] Decimal(9,3),
    [DailyDecisionConsistancy] Decimal(9,3),
    [FormLength] INT NULL, 
    [TotalN] INT NULL, 
    [TotalPass] INT NULL, 
    [TotalOther] INT NULL, 
    [TotalPassRate] DECIMAL(8, 3) NULL, 
    [TotalFirstTimeN] INT NULL, 
    [TotalFirstTimePass] INT NULL, 
    [TotalFirstTimePassRate] DECIMAL(8, 3) NULL, 
    [TotalMeanRawScore] DECIMAL(8, 3) NULL, 
    [TotalStdDev] DECIMAL(8, 3) NULL, 
    [TotalReliabilityEst] DECIMAL(8, 3) NULL,
    [TotalStdErrMean] Decimal(9,3),
    [TotalDecisionConsistancy] Decimal(9,3),
    [TotalAllScores] Int,
    [TotalSqrAllScores] int,
	[YTDN] INT NULL, 
    [YTDPass] INT NULL, 
    [YTDOther] INT NULL, 
    [YTDPassRate] DECIMAL(8, 3) NULL, 
    [YTDFirstTimeN] INT NULL, 
    [YTDFirstTimePass] INT NULL, 
    [YTDFirstTimePassRate] DECIMAL(8,3) NULL, 
    [YTDMeanRawScore] DECIMAL(8,3) NULL, 
    [YTDStdDev] DECIMAL(8,3) NULL, 
    [YTDReliabilityEst] DECIMAL(8, 3) NULL, 
    [YTDStdErrMean] Decimal(9,3),
    [YTDDecisionConsistancy] Decimal(9,3),
    [MaintenanceDate] DATETIME NOT NULL DEFAULT getdate(),
    [CrossRefKey] int
)

GO




CREATE INDEX [IX_DailyTestSummary_ClientCode] ON [Tests].[DailyTestSummary] ([ClientCode])
Include (TestTitle, TestDate)

GO

CREATE INDEX [IX_DailyTestSummary_TestTitle] ON [Tests].[DailyTestSummary] ([TestTitle])
Include (TestDate)
