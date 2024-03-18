CREATE TABLE [tests].[DailyItemSummary]
(
	[ItemSummaryId] BIGINT NOT NULL identity(1,1) PRIMARY KEY, 
    [QuestionKey] BIGINT NOT NULL, 
    [AsofDate] DATE NOT NULL, 
    [DailyN] INT NULL, 
    [DailyCorrect] INT NULL, 
    [DailyFirstTimeN] INT NULL, 
    [DailyFirstTimeCorrect] Int Null,
    [TotalSQTestScore] INT NULL, 
    [DailyCorrectScore] INT NULL, 
    [AvgElapsedTime] DECIMAL(6, 2) NULL
)
