CREATE TABLE [Dimensions].[QuestionContent](
	[QuestionContentId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceQuestionContentId] [uniqueidentifier] NOT NULL,
	[QuestionContentDBID] [bigint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[QuestionKey] [bigint] NOT NULL,
	[ContentIndex] [int] NOT NULL,
	[ContentResult] [varchar](100) NULL,
	[Points] [int] NOT NULL,
	[Correct] [bit] NULL,
	[Feedback] [varchar](1500) NULL,
	[HotspotX] [int] NULL,
	[HotspotY] [int] NULL,
	[HotspotW] [int] NULL,
	[HotspotH] [int] NULL,
	[Required] [bit] NULL,
	[Forgivable] [bit] NULL,
	[Checksum] [bigint] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[QuestionContent]  WITH CHECK ADD  CONSTRAINT [FK_QuestionContent_Questions] FOREIGN KEY([QuestionKey])
REFERENCES [Dimensions].[Questions] ([QuestionId])
GO

ALTER TABLE [Dimensions].[QuestionContent] CHECK CONSTRAINT [FK_QuestionContent_Questions]
GO
ALTER TABLE [Dimensions].[QuestionContent] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
CREATE NONCLUSTERED INDEX [IX_QuestionContent_ContentDBID] ON [Dimensions].[QuestionContent]
(
	[QuestionContentDBID] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_QuestionContent_QuestionKey] ON [Dimensions].[QuestionContent]
(
	[QuestionKey] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]