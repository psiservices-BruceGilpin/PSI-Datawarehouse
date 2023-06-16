CREATE TABLE [Bridge].[TestSession](
	[TestSessionId] [bigint] IDENTITY(1,1) NOT NULL,
	[DossierKey] [varchar](40) NOT NULL,
	[SessionKey] [varchar](40) NOT NULL,
	[CandidateKey] [int] NULL,
	[RequestorCandidateKey] [varchar](40) NULL,
	[TestKey] [int] NULL,
	[FName] [varchar](100) NOT NULL,
	[LName] [varchar](100) NOT NULL,
	[Email] [varchar](255) NULL,
	[Account] [varchar](30) NULL,
	[TestDate] [date] NULL,
	[Checksum] [int] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[LoadKey] [int] NOT NULL,
	[TestDuration] [decimal](10, 2) NULL,
	[StartTime] [time](7) NULL,
	[PDiddy] [varchar](100) NULL,
	[BookingCode] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[TestSessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestSession_DossierSession] ON [Bridge].[TestSession]
(
	[DossierKey] ASC,
	[SessionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestSession_Pdiddy] ON [Bridge].[TestSession]
(
	[PDiddy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestSession_TestDate] ON [Bridge].[TestSession]
(
	[TestDate] ASC
)
INCLUDE([DossierKey],[SessionKey],[Account]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestSession_TestKey] ON [Bridge].[TestSession]
(
	[TestKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]