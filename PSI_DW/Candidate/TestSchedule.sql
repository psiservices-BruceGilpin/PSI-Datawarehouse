CREATE TABLE [Candidate].[TestSchedule](
	[CandidateTestScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[SourceTestScheduleKey] [varchar](20) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[CandidateKey] [int] NOT NULL,
	[TestCenterScheduleKey] [int] NOT NULL,
	[ScheduleDate] [datetime] NOT NULL,
	[CountryKey] [int] NOT NULL,
	[TimeZoneKey] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[runid] [int] NOT NULL,
	[Checksum] [int] NOT NULL,
	[IsReschedule] [bit] NULL,
	[Status] [varchar](10) NULL,
	[CandidateTestScheduleDBID] [int] NULL,
	[CurrentFlag] [bit] NOT NULL,
	[PDiddyID] [varchar](100) NULL,
	[ResultsExported] [bit] NULL,
	[PDiddyTimeStamp] [datetime] NULL,
	[MultiMediaReady] [bit] NULL,
	[PriorDeliveryMethod] [varchar](20) NULL,
	[SecureBrowserURL] [varchar](1000) NULL,
	[DeliveryMethodKey] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CandidateTestScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Candidate].[TestSchedule]  WITH NOCHECK ADD  CONSTRAINT [FK_TestSchedule_Candidates] FOREIGN KEY([CandidateKey])
REFERENCES [Candidate].[Candidates] ([CandidateId])
GO

ALTER TABLE [Candidate].[TestSchedule] CHECK CONSTRAINT [FK_TestSchedule_Candidates]
GO
ALTER TABLE [Candidate].[TestSchedule]  WITH NOCHECK ADD  CONSTRAINT [FK_TestSchedule_DimCountries] FOREIGN KEY([CountryKey])
REFERENCES [dbo].[DimCountries] ([CountryID])
GO

ALTER TABLE [Candidate].[TestSchedule] CHECK CONSTRAINT [FK_TestSchedule_DimCountries]
GO
ALTER TABLE [Candidate].[TestSchedule]  WITH NOCHECK ADD  CONSTRAINT [FK_TestSchedule_DimTimeZones] FOREIGN KEY([TimeZoneKey])
REFERENCES [dbo].[DimTimeZones] ([TimeZoneId])
GO

ALTER TABLE [Candidate].[TestSchedule] CHECK CONSTRAINT [FK_TestSchedule_DimTimeZones]
GO
ALTER TABLE [Candidate].[TestSchedule]  WITH CHECK ADD  CONSTRAINT [FK_TestSchedule_TestCenterSchedule] FOREIGN KEY([TestCenterScheduleKey])
REFERENCES [Test].[TestCenterSchedule] ([TestCenterScheduleId])
GO

ALTER TABLE [Candidate].[TestSchedule] CHECK CONSTRAINT [FK_TestSchedule_TestCenterSchedule]
GO
ALTER TABLE [Candidate].[TestSchedule] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [Candidate].[TestSchedule] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_TestSchedule_CandidateKey] ON [Candidate].[TestSchedule]
(
	[CandidateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestSchedule_CandidateTestScheduleDBID] ON [Candidate].[TestSchedule]
(
	[CandidateTestScheduleDBID] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestSchedule_PDiddy] ON [Candidate].[TestSchedule]
(
	[PDiddyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]