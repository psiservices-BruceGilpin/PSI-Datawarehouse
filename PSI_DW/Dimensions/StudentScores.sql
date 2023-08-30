CREATE TABLE [Dimensions].[StudentScores](
	[StudentScoreId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceStudentScoreID] [uniqueidentifier] NOT NULL,
	[StudentScoreDBID] [bigint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[StudentListKey] [bigint] NULL,
	[TestScheduleKey] [bigint] NULL,
	[TestListKey] [bigint] NULL,
	[TestCenterKey] int null,
	[ScoreStatus] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[Enddate] [datetime] NULL,
	[ScorePoints] [int] NULL,
	[Restarts] [int] NULL,
	[Version] [int] NULL,
	[OrderSeed] [int] NULL,
	[HowLong] [int] NULL,
	[Warn] [bit] NULL,
	[Retake] [int] NULL,
	[ExtraTime] [int] NULL,
	[ExtraTimeUsed] [int] NULL,
	[ReportDate] [datetime] NULL,
	[Reports] [int] NULL,
	[Sim] [bit] NOT NULL,
	[PFA] [varchar](2) NULL,
	[AdaTime] [int] NOT NULL,
	[ExtraStatus] [int] NOT NULL,
	[ExtraStart] [datetime] NULL,
	[ExtraEnd] [datetime] NULL,
	[Proctored] [bit] NOT NULL,
	[NewSchedEnd] [datetime] NULL,
	[FinalPoints] [int] NULL,
	[ExtraPoints] [int] NULL,
	[ScaledScore] [int] NULL,
	[CheckSum] [bigint] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
    PRIMARY KEY CLUSTERED 
(
	[StudentScoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[StudentScores] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Dimensions].[StudentScores] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
CREATE NONCLUSTERED INDEX [IX_StudentScores_CurrentFlag] ON [Dimensions].[StudentScores]
(
	[CurrentFlag] ASC
)
INCLUDE([StudentListKey], [TestListkey],[StartDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_StudentScores_StudentListKey] ON [Dimensions].[StudentScores]
(
	[StudentListKey] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_StudentScores_StudentScoreDBID] ON [Dimensions].[StudentScores]
(
	[StudentScoreDBID] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_StudentScores_TestListKey] ON [Dimensions].[StudentScores]
(
	[TestListKey] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_StudentScores_TestScheduleKey] ON [Dimensions].[StudentScores]
(
	[TestScheduleKey] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]