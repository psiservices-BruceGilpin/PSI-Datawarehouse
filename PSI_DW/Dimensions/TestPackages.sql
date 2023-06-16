CREATE TABLE [Dimensions].[TestPackages](
	[TestPackageId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemId] [uniqueidentifier] NOT NULL,
	[TestPackageDBID] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[LoadDate] [date] NOT NULL,
	[AreaKey] [int] NOT NULL,
	[PackageTitle] [varchar](100) NOT NULL,
	[PackageDescription] [varchar](300) NULL,
	[Checksum] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TestPackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[TestPackages] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Dimensions].[TestPackages] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
CREATE NONCLUSTERED INDEX [IX_TestPackages_AreaKey] ON [Dimensions].[TestPackages]
(
	[AreaKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestPackages_Currentflag] ON [Dimensions].[TestPackages]
(
	[CurrentFlag] ASC
)
INCLUDE([TestPackageDBID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestPackages_PackageTitle] ON [Dimensions].[TestPackages]
(
	[PackageTitle] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestPackages_TestPackageDBID] ON [Dimensions].[TestPackages]
(
	[TestPackageDBID] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]