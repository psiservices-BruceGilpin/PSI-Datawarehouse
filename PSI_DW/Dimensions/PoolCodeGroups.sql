CREATE TABLE [Dimensions].[PoolCodeGroups](
	[PoolCodeGroupId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourcePoolGroupID] [uniqueidentifier] NOT NULL,
	[PoolCodeGroupDBID] [bigint] NOT NULL,
	[PoolKey] [bigint] NULL,
	[PoolGroupTitle] [varchar](50) NOT NULL,
	[PoolGroupDescription] [varchar](2000) NULL,
	[LoadDate] [datetime] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[CheckSum] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PoolCodeGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[PoolCodeGroups] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
ALTER TABLE [Dimensions].[PoolCodeGroups] ADD  DEFAULT ((0)) FOR [CurrentFlag]