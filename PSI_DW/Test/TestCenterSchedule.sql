CREATE TABLE [Test].[TestCenterSchedule](
	[TestCenterScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[SourceTestCenterSchKey] [varchar](20) NOT NULL,
	[BookingCode] [varchar](20) NOT NULL,
	[TestCenterKey] [int] NOT NULL,
	[ScheduleDate] [datetime] NULL,
	[StartDate] [date] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndDate] [date] NULL,
	[EndTime] [time](7) NULL,
	[Duration] [int] NULL,
	[TestCenterStatus] [varchar](7) NULL,
	[CreatedDate] [date] NOT NULL,
	[Runid] [int] NOT NULL,
	[Checksum] [int] NOT NULL,
	[TestCenterScheduleDBID] [int] NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SeatCount] [int] NULL,
	[AvailableSeatCount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TestCenterScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[TestCenterSchedule] ADD  CONSTRAINT [dfTestCenterScheduleCreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [Test].[TestCenterSchedule] ADD  CONSTRAINT [dfTestCenterScheduleCurrentFlag]  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_TestCenterSchedule_CurrentFlag] ON [Test].[TestCenterSchedule]
(
	[CurrentFlag] ASC
)
INCLUDE([TestCenterKey],[TestCenterStatus],[TestCenterScheduleDBID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestCenterSchedule_TestCenterScheduleDBID] ON [Test].[TestCenterSchedule]
(
	[TestCenterScheduleDBID] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]