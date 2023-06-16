CREATE TABLE [Candidate].[TestAssignmentPortions](
	[TestAssgnPortionId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[TestPortionKey] [int] NOT NULL,
	[TestAssignKey] [int] NOT NULL,
	[Score] [decimal](10, 6) NULL,
	[Result] [varchar](20) NULL,
	[Attempt#] [tinyint] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[ElapsedTime] [int] NULL,
	[TestedPortionOrder] [tinyint] NULL,
	[AnsweredItemCount] [int] NULL,
	[MarkedItemCount] [int] NULL,
	[RawScore] [decimal](10, 6) NULL,
	[ScaledScore] [decimal](10, 6) NULL,
	[CreateDate] [datetime] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[RunID] [int] NOT NULL,
	[TestAssignPortionDBId] [int] NULL,
	[CastedForm] [bigint] NULL,
	[ExtendedTimeAllowed] [int] NULL,
	[Take#] [tinyint] NULL,
	[ExtendedAccomodationsKey] [int] NULL,
	[LanguageKey] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TestAssgnPortionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Candidate].[TestAssignmentPortions]  WITH NOCHECK ADD  CONSTRAINT [FK_TestAssignmentPortions_TestAssignments] FOREIGN KEY([TestAssignKey])
REFERENCES [Candidate].[TestAssignments] ([TestAssignmentId])
GO

ALTER TABLE [Candidate].[TestAssignmentPortions] CHECK CONSTRAINT [FK_TestAssignmentPortions_TestAssignments]
GO
ALTER TABLE [Candidate].[TestAssignmentPortions] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [Candidate].[TestAssignmentPortions] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_TestAssignmentPortions_CurrentFlag] ON [Candidate].[TestAssignmentPortions]
(
	[CurrentFlag] ASC
)
INCLUDE([TestPortionKey],[TestAssignKey],[Result],[RawScore],[ScaledScore],[Take#]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestAssignmentPortions_TestAssignmentKey] ON [Candidate].[TestAssignmentPortions]
(
	[TestAssignKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestAssignmentPortions_TestAssmentPortionsDBID] ON [Candidate].[TestAssignmentPortions]
(
	[TestAssignPortionDBId] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]