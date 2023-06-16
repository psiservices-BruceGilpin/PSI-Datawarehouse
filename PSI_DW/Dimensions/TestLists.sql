CREATE TABLE [Dimensions].[TestLists](
	[TestListId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceTestListID] [uniqueidentifier] NOT NULL,
	[TestListDBID] [bigint] NULL,
	[CurrentFlag] [bit] NOT NULL,
	[TestPackageKey] [bigint] NULL,
	[TestKey] [bigint] NOT NULL,
	[TestSeq] [int] NOT NULL,
	[TestTitle] [varchar](150) NULL,
	[Scramble] [bit] NULL,
	[Randomize] [bit] NULL,
	[GradeType] [int] NULL,
	[WholeTime] [int] NULL,
	[WarnTime] [int] NULL,
	[Feedback] [bit] NULL,
	[Comment] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[Checksum] [bigint] NULL,
	[LoadDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TestListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[TestLists] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Dimensions].[TestLists] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
CREATE NONCLUSTERED INDEX [IX_TestLists_CurrentFlag] ON [Dimensions].[TestLists]
(
	[CurrentFlag] ASC
)
INCLUDE([TestListDBID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestLists_TestKey] ON [Dimensions].[TestLists]
(
	[TestKey] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestLists_TestListDBID] ON [Dimensions].[TestLists]
(
	[TestListDBID] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestLists_TestPackageKey] ON [Dimensions].[TestLists]
(
	[TestPackageKey] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestLists_TestTitle] ON [Dimensions].[TestLists]
(
	[TestTitle] ASC
)
INCLUDE([TestListDBID]) 
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]