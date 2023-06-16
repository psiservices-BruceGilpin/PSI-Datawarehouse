CREATE TABLE [Aspen].[Schedule](
	[ScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[Scheduledbid] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ApplicationKey] [int] NOT NULL,
	[AtlasScheduleKey] [int] NULL,
	[DateScheduled] [date] NOT NULL,
	[ExamPortionKey] [int] NOT NULL,
	[Reschedule] [bit] NULL,
	[TestResult] [nchar](10) NULL,
	[SupervisorMode] [char](1) NULL,
	[TimeScheduled] [time](7) NULL,
	[TestCenterKey] [varchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Aspen].[Schedule] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_Schedule_ApplicationKey] ON [Aspen].[Schedule]
(
	[ApplicationKey] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Schedule_AtlasScheduleKey] ON [Aspen].[Schedule]
(
	[AtlasScheduleKey] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Schedule_CurrentFlag] ON [Aspen].[Schedule]
(
	[CurrentFlag] ASC
)
INCLUDE([Scheduledbid]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Schedule_ScheduleKey] ON [Aspen].[Schedule]
(
	[SourceSystemID] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]