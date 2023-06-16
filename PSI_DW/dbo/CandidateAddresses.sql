CREATE TABLE [dbo].[CandidateAddresses](
	[CandidateAddressId] [bigint] IDENTITY(1,1) NOT NULL,
	[CandidateAddressDBID] [bigint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SourceSystemID] [smallint] NOT NULL,
	[CandidatesKey] [int] NOT NULL,
	[SourceSystemCandidateKey] [varchar](25) NOT NULL,
	[EmailAddress] [varchar](100) NULL,
	[StreetAddress] [varchar](50) NULL,
	[Unit] [varchar](20) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](10) NULL,
	[PostalCode] [varchar](15) NULL,
	[CheckSum] [bigint] NOT NULL,
	[Loaddate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CandidateAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CandidateAddresses]  WITH CHECK ADD  CONSTRAINT [FK_CandidateAddresses_Candidates] FOREIGN KEY([CandidatesKey])
REFERENCES [Candidate].[Candidates] ([CandidateId])
GO

ALTER TABLE [dbo].[CandidateAddresses] CHECK CONSTRAINT [FK_CandidateAddresses_Candidates]
GO
ALTER TABLE [dbo].[CandidateAddresses] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [dbo].[CandidateAddresses] ADD  DEFAULT (getdate()) FOR [Loaddate]
GO
CREATE NONCLUSTERED INDEX [IX_CandidateAddresses_CandidateDBID] ON [dbo].[CandidateAddresses]
(
	[CandidateAddressDBID] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]