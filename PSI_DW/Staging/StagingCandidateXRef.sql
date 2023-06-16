CREATE TABLE [Staging].[StagingCandidateXRef](
	[PDiddyCandidateKey] [varchar](100) NOT NULL,
	[PDiddyExamSessionKey] [varchar](100) NOT NULL,
	[SourceSystemKey] [int] NULL,
	[CandidateKey] [int] NULL,
	[TestSessionKey] [int] NULL,
	[RunID] [int] NOT NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [CX_StagingCandidateXRef] ON [Staging].[StagingCandidateXRef]
(
	[PDiddyCandidateKey] ASC,
	[PDiddyExamSessionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]