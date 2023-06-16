CREATE TABLE [Dimensions].[TestQuestions](
	[TestQuestionId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceTestQuestionID] [uniqueidentifier] NOT NULL,
	[TestQuestionDBID] [bigint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[TestSegmentsKey] [bigint] NOT NULL,
	[QuestionKey] [bigint] NOT NULL,
	[Section] [int] NULL,
	[QuestionSequence] [int] NULL,
	[CheckSum] [bigint] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TestQuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[TestQuestions] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
CREATE NONCLUSTERED INDEX [IX_TestQuestions_QuestionKey] ON [Dimensions].[TestQuestions]
(
	[QuestionKey] ASC,
	[TestSegmentsKey] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestQuestions_TestQuestionDBID] ON [Dimensions].[TestQuestions]
(
	[TestQuestionDBID] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]