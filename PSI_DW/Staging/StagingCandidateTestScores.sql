CREATE TABLE [Staging].[StagingCandidateTestScores](
	[SourceSystemKey] [int] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[TestAssignmentKey] [int] NOT NULL,
	[RawScore] [decimal](10, 6) NULL,
	[ScaleScore] [decimal](10, 6) NULL,
	[Result] [varchar](20) NULL,
	[ScoreType] [varchar](20) NULL,
	[ScoreDate] [datetime] NULL,
	[CheckSum] [bigint] NOT NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_StagingCandidateTestScores_Column] ON [Staging].[StagingCandidateTestScores]
(
	[SourceSystemID] ASC,
	[TestAssignmentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]