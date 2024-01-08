CREATE TABLE [Summary].[StudentAnswers]
(
	[StudentAnswersId] BIGINT NOT NULL PRIMARY KEY, 
    [StudentTestQuestionsKey] BIGINT NOT NULL, 
    [NumericChoice] SMALLINT NULL, 
    [StringChoice] VARCHAR(5) NULL, 
    [Points] DECIMAL(6, 2) NULL, 
    [LoadDate] DATETIME NOT NULL DEFAULT getdate()
)

GO

CREATE INDEX [IX_StudentAnswers_StudentTestQuestionsKey] ON [Summary].[StudentAnswers] ([StudentTestQuestionsKey])
