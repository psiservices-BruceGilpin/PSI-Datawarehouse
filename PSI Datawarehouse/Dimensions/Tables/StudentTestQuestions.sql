CREATE TABLE [Summary].[StudentTestQuestions]
(
	[StudentTestQuestionsDBId] BIGINT NOT NULL Identity(1,1) PRIMARY KEY, 
    [StudentTestSummaryKey] BIGINT NOT NULL, 
    [QuestionKey] BIGINT NOT NULL, 
    [Points] SMALLINT NOT NULL, 
    [Correct] SMALLINT NOT NULL, 
    [QuestionTime] DATETIME NULL, 
    [ElapsedTime] INT NULL, 
    [MaxPoints] SMALLINT NULL, 
    [FinalPoints] DECIMAL(6, 2) NULL, 
    [ExtraPoints] DECIMAL(6, 2) NULL
)

GO

CREATE INDEX [IX_StudentTestQuestions_StudentTestSummaryKey] ON [Summary].[StudentTestQuestions] ([StudentTestSummaryKey])

GO

CREATE INDEX [IX_StudentTestQuestions_QuestionKey] ON [Summary].[StudentTestQuestions] ([QuestionKey])
