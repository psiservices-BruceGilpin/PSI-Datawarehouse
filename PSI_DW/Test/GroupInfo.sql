CREATE TABLE [Test].[GroupInfo](
	[GroupInfoId] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupInfoDBID] [bigint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SourceSystemID] [smallint] NOT NULL,
	[SourceSystemGroupInfoID] [varchar](25) NOT NULL,
	[GroupName] [varchar](250) NOT NULL,
	[NumberOfItems] [int] NULL,
	[PortionKey] [int] NOT NULL,
	[Checksum] [bigint] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[GroupInfo] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Test].[GroupInfo] ADD  DEFAULT (getdate()) FOR [LoadDate]