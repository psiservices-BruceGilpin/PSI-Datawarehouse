CREATE TABLE [Aspen].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[PersonDBId] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[MiddleName] [varchar](25) NULL,
	[Gender] [char](1) NOT NULL,
	[Address1] [varchar](35) NOT NULL,
	[Address2] [varchar](35) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](2) NULL,
	[ZipCode] [varchar](10) NULL,
	[CountryCode] [int] NULL,
	[EMail] [varchar](100) NULL,
	[Birthdate] [date] NULL,
	[ArelloScan] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Aspen].[Person] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Aspen].[Person] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
CREATE NONCLUSTERED INDEX [IX_Person_CurrentFlag] ON [Aspen].[Person]
(
	[CurrentFlag] ASC
)
INCLUDE([PersonDBId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Person_Email] ON [Aspen].[Person]
(
	[EMail] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Person_Name] ON [Aspen].[Person]
(
	[LastName] ASC,
	[FirstName] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]