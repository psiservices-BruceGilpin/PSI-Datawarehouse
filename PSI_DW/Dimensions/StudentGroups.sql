CREATE TABLE [Dimensions].[StudentGroups](
	[StudentGroupId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [nchar](10) NOT NULL,
	[SourceGroupID] [uniqueidentifier] NOT NULL,
	[StudentGroupDBID] [bigint] NOT NULL,
	[StudentPoolKey] [bigint] NOT NULL,
	[PoolKey] [bigint] NULL,
	[CurrentFlag] [bit] NOT NULL,
	[StudentGrpTitle] [varchar](50) NOT NULL,
	[CheckSum] [bigint] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[StudentGroups] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Dimensions].[StudentGroups] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
CREATE NONCLUSTERED INDEX [IX_StudentGroups_Currentflag] ON [Dimensions].[StudentGroups]
(
	[CurrentFlag] ASC
)
INCLUDE([StudentGroupDBID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_StudentGroups_PoolKey] ON [Dimensions].[StudentGroups]
(
	[PoolKey] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_StudentGroups_StudentGroupDBID] ON [Dimensions].[StudentGroups]
(
	[StudentGroupDBID] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_StudentGroups_StudentGrpTitle] ON [Dimensions].[StudentGroups]
(
	[StudentGrpTitle] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]