CREATE TABLE [Dimensions].[Areas](
	[AreaId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceAreaID] [uniqueidentifier] NOT NULL,
	[AreaDBID] [int] NOT NULL,
	[AreaTitle] [varchar](50) NOT NULL,
	[AreaDescirption] [varchar](2000) NULL,
	[CurrentFlag] [bit] NOT NULL,
	[CheckSum] [bigint] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[Areas] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Dimensions].[Areas] ADD  DEFAULT (getdate()) FOR [LoadDate]