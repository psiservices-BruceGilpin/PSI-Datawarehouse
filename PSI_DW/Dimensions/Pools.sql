CREATE TABLE [Dimensions].[Pools](
	[PoolId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourcePoolID] [uniqueidentifier] NOT NULL,
	[PoolDbID] [bigint] NOT NULL,
	[PoolCodeGroupKey] [bigint] NULL,
	[PoolTitle] [varchar](50) NOT NULL,
	[PoolDesc] [varchar](2000) NULL,
	[LoadDate] [datetime] NOT NULL,
	[CheckSum] [bigint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[Pools]  WITH CHECK ADD  CONSTRAINT [FK_Pools_PoolCodeGroups] FOREIGN KEY([PoolCodeGroupKey])
REFERENCES [Dimensions].[PoolCodeGroups] ([PoolCodeGroupId])
GO

ALTER TABLE [Dimensions].[Pools] CHECK CONSTRAINT [FK_Pools_PoolCodeGroups]
GO
ALTER TABLE [Dimensions].[Pools] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
ALTER TABLE [Dimensions].[Pools] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_Pools_CodeGroupKey] ON [Dimensions].[Pools]
(
	[PoolCodeGroupKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Pools_Currentflag] ON [Dimensions].[Pools]
(
	[CurrentFlag] ASC
)
INCLUDE([PoolDbID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Pools_PoolDBID] ON [Dimensions].[Pools]
(
	[PoolDbID] ASC
)
INCLUDE([PoolTitle]) 
WHERE ([currentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]