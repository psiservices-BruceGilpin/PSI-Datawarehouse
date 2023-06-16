CREATE TABLE [Candidate].[TestLaunch](
	[TestLaunchId] [int] IDENTITY(1,1) NOT NULL,
	[TestLaunchDBID] [int] NOT NULL,
	[CandidateKey] [bigint] NOT NULL,
	[TestLaunchDate] [date] NOT NULL,
	[ValidUpto] [date] NULL,
	[CandidateScheduleKey] [int] NOT NULL,
	[LaunchCount] [int] NULL,
	[TestContentLaunchDate] [date] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[Checksum] [bigint] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[TestLaunchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Candidate].[TestLaunch] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [Candidate].[TestLaunch] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE CLUSTERED INDEX [IX_TestLaunch_TestRegn] ON [Candidate].[TestLaunch]
(
	[CandidateKey] ASC,
	[CandidateScheduleKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestLaunch_CurrentFlag] ON [Candidate].[TestLaunch]
(
	[CurrentFlag] ASC
)
INCLUDE([CandidateKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestLaunch_TestLaunchDBID] ON [Candidate].[TestLaunch]
(
	[TestLaunchDBID] ASC
)
WHERE ([currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]