CREATE TABLE [Test].[TestCenter](
	[TestCenterId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[SourceTestCenterKey] [varchar](100) NOT NULL,
	[TestCenterName] [varchar](100) NOT NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](30) NULL,
	[Zip] [varchar](10) NULL,
	[Checksum] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[RunID] [int] NOT NULL,
	[CountryKey] [int] NULL,
	[PropertyType] [varchar](10) NULL,
	[TestCenterDBID] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[NetSuiteKey] [varchar](20) NULL,
	[ActiveStatusKey] [int] NULL,
	[GlobalTestCenterKey] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[TestCenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[TestCenter] ADD  CONSTRAINT [dfTestCenterCreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [Test].[TestCenter] ADD  CONSTRAINT [dfTestCenterCurrentFlag]  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_TestCenter_TestCenterDBID] ON [Test].[TestCenter]
(
	[TestCenterDBID] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]