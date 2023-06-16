CREATE TABLE [Candidate].[TestScores](
	[TestScoreId] [int] IDENTITY(1,1) NOT NULL,
	[TestScoreDBID] [int] NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[TestAssignmentKey] [int] NOT NULL,
	[RawScore] [decimal](10, 6) NULL,
	[ScaleScore] [decimal](10, 6) NULL,
	[Result] [varchar](20) NULL,
	[ScoreType] [varchar](20) NULL,
	[ScoreDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[Checksum] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TestScoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Candidate].[TestScores]  WITH CHECK ADD  CONSTRAINT [FK_TestScores_TestAssignment] FOREIGN KEY([TestAssignmentKey])
REFERENCES [Candidate].[TestAssignments] ([TestAssignmentId])
GO

ALTER TABLE [Candidate].[TestScores] CHECK CONSTRAINT [FK_TestScores_TestAssignment]
GO
ALTER TABLE [Candidate].[TestScores] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [Candidate].[TestScores] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_TestScores_TestAssignmentKey] ON [Candidate].[TestScores]
(
	[TestAssignmentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestScores_TestScoreDBID] ON [Candidate].[TestScores]
(
	[TestScoreDBID] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]