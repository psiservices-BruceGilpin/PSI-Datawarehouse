CREATE TABLE [Account].[AccountSchool](
	[AccountSchoolId] [int] IDENTITY(1,1) NOT NULL,
	[SourceAccountSchoolKey] [varchar](20) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[AccountKey] [int] NOT NULL,
	[SchoolCode] [varchar](10) NOT NULL,
	[SchoolName] [varchar](100) NOT NULL,
	[Description] [varchar](255) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](2) NULL,
	[Status] [tinyint] NOT NULL,
	[Checksum] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[RunID] [int] NOT NULL,
	[AccountSchoolDBId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountSchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Account].[AccountSchool]  WITH CHECK ADD  CONSTRAINT [FK_AccountSchool_Account] FOREIGN KEY([AccountKey])
REFERENCES [Account].[Accounts] ([AccountId])
GO

ALTER TABLE [Account].[AccountSchool] CHECK CONSTRAINT [FK_AccountSchool_Account]
GO
ALTER TABLE [Account].[AccountSchool] ADD  DEFAULT (' ') FOR [SchoolCode]
GO
ALTER TABLE [Account].[AccountSchool] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [Account].[AccountSchool] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_AccountSchool_AccountSchoolDBID] ON [Account].[AccountSchool]
(
	[AccountSchoolDBId] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AccountSchool_SourceAccountSchoolKey] ON [Account].[AccountSchool]
(
	[SourceAccountSchoolKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]