CREATE TABLE [Aspen].[Candidates](
	[AspenCandidateId] [int] IDENTITY(1,1) NOT NULL,
	[AspenCandidateDBId] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemKID] [varchar](20) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[Address1] [varchar](35) NOT NULL,
	[Address2] [varchar](35) NULL,
	[City] [varchar](50) NOT NULL,
	[ZipCode] [varchar](5) NULL,
	[county] [varchar](20) NULL,
	[CountryKey] [int] NULL,
	[Gender] [char](1) NOT NULL,
	[Birthdate] [date] NULL,
	[ArelloScan] [date] NULL,
	[ArelloStatus] [smallint] NULL,
	[TextAcceptanceDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[AspenCandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Aspen].[Candidates] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
CREATE NONCLUSTERED INDEX [IX_Candidates_ApplicantName] ON [Aspen].[Candidates]
(
	[LastName] ASC,
	[FirstName] ASC
)
WHERE ([currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Candidates_Currentflag] ON [Aspen].[Candidates]
(
	[CurrentFlag] ASC
)
INCLUDE([AspenCandidateDBId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]