CREATE TABLE [Summary].[SchoolMeasures](
	[SchoolPassRateeId] [int] IDENTITY(1,1) NOT NULL,
	[SchoolKey] [int] NOT NULL,
	[PortionKey] [int] NOT NULL,
	[PrelicensingSchoolName] [varchar](100) NULL,
	[FormName] [varchar](50) NULL,
	[AsOfDate] [date] NOT NULL,
	[AllCandidatePassRate] [decimal](10, 3) NULL,
	[AllCandidateN] [int] NULL,
	[AllCandidatePass] [int] NULL,
	[FirstTimeN] [int] NULL,
	[FirstTimePass] [int] NULL,
	[FirstTimePassRate] [decimal](10, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[SchoolPassRateeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SchoolMeasures_AsOfDate] ON [Summary].[SchoolMeasures]
(
	[AsOfDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SchoolMeasures_SchoolKey] ON [Summary].[SchoolMeasures]
(
	[SchoolKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]