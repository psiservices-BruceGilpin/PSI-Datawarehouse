CREATE TABLE [tests].[DailyItemSummary]
(
	[ItemSummaryId] BIGINT NOT NULL identity(1,1) PRIMARY KEY, 
    [TestquestionKey] BIGINT NOT NULL, 
    [QuestionKey] BIGINT NOT NULL, 
    [AsofDate] DATE NOT NULL, 
    [DailyN] INT NULL, 
    [DailyCorrect] INT NULL, 
    [TotalTestScore] INT NULL, 
    [TotalSQTestScore] INT NULL, 
    [DailyCorrectScore] INT NULL
)
