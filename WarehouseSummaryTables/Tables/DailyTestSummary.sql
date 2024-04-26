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
    [DailyScoreTotal] int Null,
    [DailyPassRate] DECIMAL(10, 3) NULL, 
    [DailyFirstTimePassRate] Decimal(10,3),
    [DailyMeanRawScore] Decimal(10,3),
    [DailyStdDev] Decimal(10,3),
    [DailyReliabilityEst] Decimal(10,3),
    [DailyStdErrMean] Decimal(10,3),
    [DailyDecisionConsistancy] Decimal(10,3),
    [FormLength] INT NULL, 
    [TotalN] INT NULL, 
    [TotalPass] INT NULL, 
    [TotalOther] INT NULL, 
    [TotalPassRate] DECIMAL(8, 3) NULL, 
    [TotalFirstTimeN] INT NULL, 
    [TotalFirstTimePass] INT NULL, 
    [TotalScore]    Int Null,
    [TotalFirstTimePassRate] DECIMAL(10, 3) NULL, 
    [TotalMeanRawScore] DECIMAL(10, 3) NULL, 
    [TotalStdDev] DECIMAL(10, 3) NULL, 
    [TotalReliabilityEst] DECIMAL(10, 3) NULL,
    [TotalStdErrMean] Decimal(10,3),
    [TotalDecisionConsistancy] Decimal(10,3),
    [TotalSqrAllScores] BIGINT,
	[YTDN] INT NULL, 
    [YTDPass] INT NULL, 
    [YTDOther] INT NULL, 
    [YTDPassRate] DECIMAL(8, 3) NULL, 
    [YTDFirstTimeN] INT NULL, 
    [YTDFirstTimePass] INT NULL, 
    [YTDTotalScore] Int null,
    [YTDFirstTimePassRate] DECIMAL(10,3) NULL, 
    [YTDMeanRawScore] DECIMAL(10,3) NULL, 
    [YTDStdDev] DECIMAL(10,3) NULL, 
    [YTDReliabilityEst] DECIMAL(10, 3) NULL, 
    [YTDStdErrMean] Decimal(10,3),
    [YTDDecisionConsistancy] Decimal(10,3),
    [MaintenanceDate] DATETIME NOT NULL DEFAULT getdate(),
    [CrossRefKey] int NOT NULL
)

GO




CREATE INDEX [IX_DailyTestSummary_ClientCode] ON [Tests].[DailyTestSummary] ([ClientCode])
Include (TestTitle, TestDate)

GO

CREATE INDEX [IX_DailyTestSummary_TestTitle] ON [Tests].[DailyTestSummary] ([TestTitle])
Include (TestDate)
