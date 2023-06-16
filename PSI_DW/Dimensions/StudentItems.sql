CREATE TABLE [Dimensions].[StudentItems](
	[StudentItemId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](50) NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Checksum] [bigint] NOT NULL,
	[StudentItemDBID] [bigint] NOT NULL,
	[StudentScoreKey] [bigint] NOT NULL,
	[TestQuestionKey] [bigint] NOT NULL,
	[Points] [smallint] NULL,
	[Correct] [smallint] NULL,
	[QuestionTime] [datetime] NULL,
	[ElapsedTime] [int] NULL,
	[MaxPoints] [smallint] NULL,
	[QuestionSequence] [smallint] NULL,
	[FinalPoints] [decimal](6, 2) NULL,
	[ExtraPoints] [decimal](6, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[StudentItems] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Dimensions].[StudentItems] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
CREATE NONCLUSTERED INDEX [IX_StudentItems_CurrentFlag] ON [Dimensions].[StudentItems]
(
	[CurrentFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_StudentItems_StudentItemDBID] ON [Dimensions].[StudentItems]
(
	[StudentItemDBID] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_StudentItems_StudentScoreKey] ON [Dimensions].[StudentItems]
(
	[StudentScoreKey] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_StudentItems_TestQuestionKey] ON [Dimensions].[StudentItems]
(
	[TestQuestionKey] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]