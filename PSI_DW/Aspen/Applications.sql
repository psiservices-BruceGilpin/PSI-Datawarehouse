CREATE TABLE [Aspen].[Applications](
	[ApplicationId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationDBID] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[AdaAddedMinutes] [int] NULL,
	[AdaMultiplier] [decimal](3, 2) NULL,
	[ApplicantID] [varchar](12) NULL,
	[ApplicationDate] [date] NULL,
	[ApplicationSource] [varchar](2) NULL,
	[AtlasRegistrationID] [varchar](19) NULL,
	[ClientCode] [varchar](2) NULL,
	[DeliveryMethod] [varchar](10) NULL,
	[EligibilityBeginDate] [date] NULL,
	[EligibilityEndDate] [date] NULL,
	[EnrollmentDate] [date] NULL,
	[ExamId] [varchar](12) NULL,
	[FirmLicense] [varchar](6) NULL,
	[GraduationDate] [date] NULL,
	[PersonKey] [int] NULL,
	[Reapplicant] [bit] NULL,
	[Recertification] [bit] NULL,
	[ReleaseScores] [bit] NULL,
	[StatusDate] [date] NULL,
	[Checksum] [bigint] NULL,
	[CreateDate] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Aspen].[Applications] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_Applications_ApplicantID] ON [Aspen].[Applications]
(
	[ApplicantID] ASC
)
WHERE ([currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Applications_CurrentFlag] ON [Aspen].[Applications]
(
	[CurrentFlag] ASC
)
INCLUDE([ApplicationDBID],[ExamId],[ApplicantID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Applications_ExamID] ON [Aspen].[Applications]
(
	[ExamId] ASC
)
WHERE ([currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]