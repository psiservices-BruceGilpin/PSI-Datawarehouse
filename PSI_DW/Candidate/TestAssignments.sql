CREATE TABLE [Candidate].[TestAssignments](
	[TestAssignmentId] [int] IDENTITY(1,1) NOT NULL,
	[SourceTestAssignKey] [varchar](20) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[TestKey] [int] NOT NULL,
	[AccountKey] [int] NOT NULL,
	[CandidateKey] [int] NOT NULL,
	[TestScheduleKey] [int] NOT NULL,
	[TestDate] [datetime] NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [date] NULL,
	[TotalElapsedTime] [int] NULL,
	[CheckInTime] [datetime] NULL,
	[UpdloadMode] [varchar](10) NULL,
	[CreateDate] [datetime] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[RunID] [int] NOT NULL,
	[CheckinLanguageKey] [int] NULL,
	[ProctorLanguageKey] [int] NULL,
	[TestAssignmentDBID] [int] NULL,
	[DeleiveryMethodKey] [int] NULL,
	[EligibilityDate] [date] NULL,
	[SeatID] [int] NULL,
	[SeatCode] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[TestAssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Candidate].[TestAssignments]  WITH NOCHECK ADD  CONSTRAINT [FK_TestAssignments_Candidate] FOREIGN KEY([CandidateKey])
REFERENCES [Candidate].[Candidates] ([CandidateId])
GO

ALTER TABLE [Candidate].[TestAssignments] CHECK CONSTRAINT [FK_TestAssignments_Candidate]
GO
ALTER TABLE [Candidate].[TestAssignments]  WITH CHECK ADD  CONSTRAINT [FK_TestAssignments_SourceSystem] FOREIGN KEY([SourceSystemKey])
REFERENCES [dbo].[SourceSystems] ([SourceSystemId])
GO

ALTER TABLE [Candidate].[TestAssignments] CHECK CONSTRAINT [FK_TestAssignments_SourceSystem]
GO
ALTER TABLE [Candidate].[TestAssignments] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [Candidate].[TestAssignments] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_TestAssignments_AccountKey] ON [Candidate].[TestAssignments]
(
	[AccountKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestAssignments_CandidateKey] ON [Candidate].[TestAssignments]
(
	[CandidateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestAssignments_Column] ON [Candidate].[TestAssignments]
(
	[TestKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestAssignments_CurrentFlag] ON [Candidate].[TestAssignments]
(
	[CurrentFlag] ASC, [TestDate]
)
INCLUDE([TestKey],[CandidateKey],[TestAssignmentDBID],[DeleiveryMethodKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestAssignments_SourceTestAssignKeyCurrentflag] ON [Candidate].[TestAssignments]
(
	[SourceTestAssignKey] ASC,
	[CurrentFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestAssignments_TestAssignmentDBKey] ON [Candidate].[TestAssignments]
(
	[TestAssignmentDBID] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]