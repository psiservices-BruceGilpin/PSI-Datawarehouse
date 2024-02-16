CREATE TABLE [Tests].[DailyTestSummary]
(
	[DailyTestSummaryId] BIGINT NOT NULL Identity(1,1) PRIMARY KEY, 
    [ClientCode] VARCHAR(16) NULL, 
    [TestTitle] VARCHAR(2000) NOT NULL, 
    [TestDate] DATE NOT NULL, 
    [PassingScore] Int,
    [DailyCandidateN] INT NULL, 
    [DailyCandidatePass] INT NULL, 
    [DailyCandidateOther] INT NULL, 
    [DailyCandidatePassRate] DECIMAL(5, 2) NULL, 
    [DailyFirstTimeN] INT NULL, 
    [DailyFirstTimePass] INT NULL, 
    [DailyFirstTimePassRate] DECIMAL(5, 2) NULL, 
    [FormLength] INT NULL, 
    [TotalCandidateN] INT NULL, 
    [TotalCandidatePass] INT NULL, 
    [TotalCandidateOther] INT NULL, 
    [TotalPassRate] DECIMAL(7, 2) NULL, 
    [TotalFirstTimeN] INT NULL, 
    [TotalFirstTimePass] INT NULL, 
    [TotalFirstTimePassRate] DECIMAL(7, 2) NULL, 
    [TotalMeanRawScore] DECIMAL(7, 2) NULL, 
    [TotalStdDev] DECIMAL(6, 3) NULL, 
    [TotalReliabilityEst] DECIMAL(7, 3) NULL,
	[YTDCandidateN] INT NULL, 
    [YTDCandidatePass] INT NULL, 
    [YTDCandidateOther] INT NULL, 
    [YTDPassRate] DECIMAL(7, 2) NULL, 
    [YTDFirstTimeN] INT NULL, 
    [YTDFirstTimePass] INT NULL, 
    [YTDFirstTimePassRate] DECIMAL(7, 2) NULL, 
    [YTDMeanRawScore] DECIMAL(7, 2) NULL, 
    [YTDStdDev] DECIMAL(6, 3) NULL, 
    [YTDReliabilityEst] DECIMAL(7, 3) NULL, 
    [MaintenanceDate] DATETIME NOT NULL DEFAULT getdate()
)

GO


