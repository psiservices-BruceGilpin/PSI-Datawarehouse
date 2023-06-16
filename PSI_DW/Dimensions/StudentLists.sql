CREATE TABLE [Dimensions].[StudentLists](
	[StudentListId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceStudentListID] [uniqueidentifier] NOT NULL,
	[StudentListDBID] [bigint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[StudentKey] [bigint] NOT NULL,
	[StudentGroupKey] [bigint] NULL,
	[StudentListType] [bit] NULL,
	[StudentStatus] [bit] NULL,
	[HideReports] [bit] NULL,
	[InsReports] [bit] NULL,
	[LoadDate] [datetime] NOT NULL,
	[CheckSum] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[StudentLists] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Dimensions].[StudentLists] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
CREATE NONCLUSTERED INDEX [IX_StudentLists_CurrentFlag] ON [Dimensions].[StudentLists]
(
	[CurrentFlag] ASC
)
INCLUDE([StudentListDBID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_StudentLists_StudentGroupKey] ON [Dimensions].[StudentLists]
(
	[StudentGroupKey] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_StudentLists_StudentKey] ON [Dimensions].[StudentLists]
(
	[StudentKey] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_StudentLists_StudentListDBID] ON [Dimensions].[StudentLists]
(
	[StudentListDBID] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]