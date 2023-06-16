CREATE TABLE [Dimensions].[Questions](
	[QuestionId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceQuestionID] [uniqueidentifier] NOT NULL,
	[QuestionDBID] [bigint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[QuestionTitle] [varchar](50) NOT NULL,
	[QuestionDescription] [varchar](2000) NULL,
	[QuestionType] [int] NULL,
	[QuestionStatus] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[QuestionChoices] [int] NOT NULL,
	[QuestionColumns] [int] NOT NULL,
	[CorrectChoice] [int] NOT NULL,
	[MaxResponses] [int] NOT NULL,
	[PartialCredit] [bit] NULL,
	[UseHints] [bit] NULL,
	[ChoiceFeedback] [bit] NULL,
	[MaxPoints] [decimal](6, 4) NULL,
	[MinPoints] [decimal](6, 4) NULL,
	[TimeLimit] [int] NULL,
	[LeadInKey] [bigint] NULL,
	[Admins] [int] NOT NULL,
	[QuestionELT] [decimal](12, 5) NULL,
	[QuestionsDiff] [decimal](8, 5) NULL,
	[QuestionsRPB] [decimal](9, 5) NULL,
	[QuestionsAvg] [decimal](10, 5) NULL,
	[Omits] [int] NULL,
	[Stem] [varchar](2500) NOT NULL,
	[QuestionNotes] [varchar](4000) NULL,
	[RefCollapsed] [bit] NULL,
	[Feedback] [varchar](4000) NULL,
	[Range1] [int] NULL,
	[Range2] [int] NULL,
	[Seed] [int] NULL,
	[Scrambled] [bit] NULL,
	[MatchCase] [bit] NULL,
	[ExtraPointstype] [int] NULL,
	[ExtraPoints] [int] NULL,
	[SimStart] [bit] NULL,
	[QuestionState] [int] NOT NULL,
	[QuestionClass] [int] NOT NULL,
	[QuestionLocked] [int] NOT NULL,
	[ContentAreaKey] [bigint] NULL,
	[ContentSubAreaKey] [bigint] NULL,
	[MainQuestionKey] [bigint] NULL,
	[MainIdx] [int] NOT NULL,
	[MainType] [int] NULL,
	[UserValue1] [varchar](50) NULL,
	[UserValue2] [varchar](50) NULL,
	[Uservalue3] [varchar](50) NULL,
	[Uservalue4] [varchar](50) NULL,
	[Refx] [int] NULL,
	[Refw] [int] NULL,
	[RefH] [int] NULL,
	[SourceID] [varchar](50) NULL,
	[Theta] [decimal](6, 4) NULL,
	[InfTheta] [decimal](6, 4) NULL,
	[LoadDate] [datetime] NULL,
	[CheckSum] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[Questions] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Dimensions].[Questions] ADD  DEFAULT ((0)) FOR [PartialCredit]
GO
ALTER TABLE [Dimensions].[Questions] ADD  DEFAULT ((0)) FOR [UseHints]
GO
ALTER TABLE [Dimensions].[Questions] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
CREATE NONCLUSTERED INDEX [IX_Questions_QuestionDBID] ON [Dimensions].[Questions]
(
	[QuestionDBID] ASC
)
INCLUDE([QuestionTitle]) 
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Questions_QuestionTitle] ON [Dimensions].[Questions]
(
	[QuestionTitle] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]