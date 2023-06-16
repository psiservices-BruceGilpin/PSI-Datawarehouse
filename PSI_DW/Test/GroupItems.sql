CREATE TABLE [Test].[GroupItems](
	[GroupItemsId] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupItemsDBID] [bigint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SouceSystemGroupItemID] [varchar](25) NOT NULL,
	[GroupInfoKey] [bigint] NOT NULL,
	[TopicAreaKey] [bigint] NOT NULL,
	[ItemBankKey] [bigint] NOT NULL,
	[TaxonomyKey] [bigint] NOT NULL,
	[CheckSum] [bigint] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupItemsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[GroupItems] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Test].[GroupItems] ADD  DEFAULT (getdate()) FOR [LoadDate]