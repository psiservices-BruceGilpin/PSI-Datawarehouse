CREATE TABLE [tests].[DailyItemSummary]
(
	[ItemSummaryId] BIGINT NOT NULL identity(1,1) PRIMARY KEY, 
    [SummaryTestName] varchar(2000) Not null,
    [QuestionKey] BIGINT NOT NULL, 
    [AsofDate] DATE NOT NULL, 
    [TotalN] INT NULL, 
    [TotalCorrect] INT NULL, 
    [TotalFirstTimeN] INT NULL, 
    [TotalFirstTimeCorrect] Int Null,
    [TotalSQTestScore] INT NULL, 
    [TotalCorrectScore] INT NULL, 
    [AvgElapsedTime] DECIMAL(6, 2) NULL
)
