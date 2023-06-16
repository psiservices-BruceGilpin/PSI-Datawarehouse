CREATE TABLE [Bridge].[CandidateXRef](
	[CandidateXRefId] [bigint] IDENTITY(1,1) NOT NULL,
	[PDiddyCandidateKey] [varchar](100) NOT NULL,
	[PDiddyExamSessionKey] [varchar](100) NOT NULL,
	[SourceSystemKey] [int] NULL,
	[CandidateKey] [int] NULL,
	[TestSessionKey] [int] NULL,
	[RunID] [int] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CandidateXRefId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Bridge].[CandidateXRef] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
CREATE NONCLUSTERED INDEX [IX_CandidateXRef_CandidateKey] ON [Bridge].[CandidateXRef]
(
	[CandidateKey] ASC
)
INCLUDE([PDiddyCandidateKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CandidateXRef_ExamSessionKey] ON [Bridge].[CandidateXRef]
(
	[TestSessionKey] ASC
)
INCLUDE([PDiddyExamSessionKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]