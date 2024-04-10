CREATE TABLE [Tests].[TestQuestionUsageCnt]
(
	[TestQuestionUsageCntId] INT NOT NULL  identity(1,1) PRIMARY KEY, 
    [ClientCode] VARCHAR(50) NOT NULL, 
    [SummaryTestName] VARCHAR(2000) NOT NULL, 
    [QuestionTitle] varchar(50) not null,
    [CandidateN] INT NOT NULL, 
    [LoadDate] DATETIME NOT NULL DEFAULT getdate()
)
