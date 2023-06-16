CREATE TABLE [Candidate].[Responses](
	[CandidateResponseId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[TestAssignPortionKey] [int] NULL,
	[FixedFormKey] [int] NULL,
	[ItemBankKey] [int] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[TimeAllowed] [int] NULL,
	[TimeElapsed] [int] NULL,
	[IsCorrect] [bit] NULL,
	[IsMarked] [bit] NULL,
	[TimesChanged] [tinyint] NULL,
	[ISGFlag] [tinyint] NULL,
	[TotalWeightage] [decimal](10, 6) NULL,
	[Weightage] [decimal](10, 6) NULL,
	[DateCreated] [datetime] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[CandidateResponseDBId] [int] NULL,
	[Checksum] [int] NULL,
	[PartitionValue] [int] NOT NULL,
	[ResponseChoiceKey] [bigint] NULL,
	[Comments] [varchar](1500) NULL,
 CONSTRAINT [PK_CandidateResponse] PRIMARY KEY CLUSTERED 
(
	[PartitionValue] ASC,
	[CandidateResponseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [CandidateResponse]([PartitionValue])
) ON [CandidateResponse]([PartitionValue])
GO
ALTER TABLE [Candidate].[Responses]  WITH CHECK ADD  CONSTRAINT [FK_Responses_ToItemBank] FOREIGN KEY([ItemBankKey])
REFERENCES [Test].[ItemBank] ([ItemBankId])
GO

ALTER TABLE [Candidate].[Responses] CHECK CONSTRAINT [FK_Responses_ToItemBank]
GO
ALTER TABLE [Candidate].[Responses]  WITH CHECK ADD  CONSTRAINT [FK_Responses_ToTestAssignmentPortions] FOREIGN KEY([TestAssignPortionKey])
REFERENCES [Candidate].[TestAssignmentPortions] ([TestAssgnPortionId])
GO

ALTER TABLE [Candidate].[Responses] CHECK CONSTRAINT [FK_Responses_ToTestAssignmentPortions]
GO
ALTER TABLE [Candidate].[Responses] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [Candidate].[Responses] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_Responses_CandidateResponseDBID] ON [Candidate].[Responses]
(
	[CandidateResponseDBId] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [CandidateResponse]([PartitionValue])
GO
CREATE NONCLUSTERED INDEX [IX_Responses_CurrentFlag] ON [Candidate].[Responses]
(
	[CurrentFlag] ASC
)
INCLUDE([TestAssignPortionKey],[CandidateResponseDBId],[FixedFormKey],[TimeElapsed]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [CandidateResponse]([PartitionValue])
GO
CREATE NONCLUSTERED INDEX [IX_Responses_ItemBankKey] ON [Candidate].[Responses]
(
	[ItemBankKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [CandidateResponse]([PartitionValue])
GO
CREATE NONCLUSTERED INDEX [IX_Responses_PortionKey] ON [Candidate].[Responses]
(
	[TestAssignPortionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [CandidateResponse]([PartitionValue])