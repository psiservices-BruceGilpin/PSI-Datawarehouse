CREATE TABLE [Candidate].[Candidates](
	[CandidateId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[SourceCandidateKey] [varchar](20) NULL,
	[CandidateAltKey] [varchar](256) NOT NULL,
	[FirstName] [varchar](256) NOT NULL,
	[LastName] [varchar](256) NOT NULL,
	[TestKey] [int] NULL,
	[RegistrationDate] [date] NOT NULL,
	[RegistrationTypeKey] [int] NULL,
	[ExpirationDate] [date] NULL,
	[StatusCode] [varchar](8) NOT NULL,
	[SchoolKey] [int] NULL,
	[SuspectedForFraud] [bit] NOT NULL,
	[DOB] [varchar](255) NULL,
	[EmailAddress] [varchar](255) NULL,
	[StreetAddress1] [varchar](255) NULL,
	[StreetAddress2] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](256) NULL,
	[PostalCode] [varchar](10) NULL,
	[Country] [varchar](256) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CurrentFlag] [bit] NULL,
	[CheckSum] [int] NOT NULL,
	[RunID] [int] NOT NULL,
	[CandidateTypeKey] [smallint] NULL,
	[CandidateDBId] [int] NULL,
	[AtlasCloudCandidateID] [bigint] NULL,
	[DimensionsStudentID] [uniqueidentifier] NULL,
	[Birthdate] DATE NULL, 
    [GenderCode] INT NULL, 
    [AgeRangeCode] INT NULL, 
    [EducationCode] INT NULL, 
    [LanguageCode] INT NULL, 
    PRIMARY KEY CLUSTERED 
(
	[CandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Candidate].[Candidates] ADD  DEFAULT (' ') FOR [FirstName]
GO
ALTER TABLE [Candidate].[Candidates] ADD  DEFAULT ((0)) FOR [TestKey]
GO
ALTER TABLE [Candidate].[Candidates] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [Candidate].[Candidates] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_Candidates_CandidateDBID] ON [Candidate].[Candidates]
(
	[CandidateDBId] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Candidates_CurrentFlag] ON [Candidate].[Candidates]
(
	[CurrentFlag] ASC
)
INCLUDE([SchoolKey],[CandidateDBId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Candidates_Names] ON [Candidate].[Candidates]
(
	[LastName] ASC,
	[FirstName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Candidates_SourceCandidateKey] ON [Candidate].[Candidates]
(
	[SourceCandidateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Candidates_TestKey] ON [Candidate].[Candidates]
(
	[TestKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]