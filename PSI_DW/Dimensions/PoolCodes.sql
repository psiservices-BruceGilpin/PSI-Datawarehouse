CREATE TABLE [Dimensions].[PoolCodes](
	[PoolCodeId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourcePoolCodeKey] [uniqueidentifier] NOT NULL,
	[PoolCodeGroupKey] [bigint] NULL,
	[PoolTitle] [varchar](50) NOT NULL,
	[PoolDescription] [varchar](2000) NULL,
	[LoadDate] [datetime] NOT NULL,
	[PoolCodeDBID] [bigint] NOT NULL,
	[CheckSum] [bigint] NOT NULL,
	[CurrentFlag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PoolCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[PoolCodes] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
ALTER TABLE [Dimensions].[PoolCodes] ADD  DEFAULT ((0)) FOR [CurrentFlag]