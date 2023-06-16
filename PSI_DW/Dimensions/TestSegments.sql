CREATE TABLE [Dimensions].[TestSegments](
	[TestSegmentId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceTestSegmentID] [uniqueidentifier] NOT NULL,
	[TestSegmentDBID] [bigint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[TestKey] [bigint] NOT NULL,
	[SegmentTitle] [varchar](50) NOT NULL,
	[SegmentSeq] [int] NOT NULL,
	[SegmentCount] [int] NOT NULL,
	[SegmentSection] [int] NOT NULL,
	[SegmentType] [int] NOT NULL,
	[BankObjectivesKey] [bigint] NULL,
	[CheckSum] [bigint] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TestSegmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[TestSegments] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Dimensions].[TestSegments] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
CREATE NONCLUSTERED INDEX [IX_TestSegments_SegmentTitle] ON [Dimensions].[TestSegments]
(
	[SegmentTitle] ASC
)
INCLUDE([TestSegmentDBID]) 
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestSegments_TestKey] ON [Dimensions].[TestSegments]
(
	[TestKey] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestSegments_TestSegmentDBID] ON [Dimensions].[TestSegments]
(
	[TestSegmentDBID] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]