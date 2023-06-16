CREATE TABLE [Test].[ItemBank](
	[ItemBankId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[SourceItemKey] [varchar](20) NOT NULL,
	[TaxonomyKey] [int] NULL,
	[SourceItemID] [varchar](20) NOT NULL,
	[Stem] [varchar](5000) NOT NULL,
	[ItemOwnershipKey] [tinyint] NOT NULL,
	[MinWeightToConsider] [decimal](10, 6) NULL,
	[MaxOptionsSelectable] [smallint] NULL,
	[AllowPartialScoring] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[CheckSum] [int] NOT NULL,
	[ItemBankDBID] [int] NULL,
	[PracticeItem] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemBankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[ItemBank] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [Test].[ItemBank] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_ItemBank_ItemBankDBID] ON [Test].[ItemBank]
(
	[ItemBankDBID] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemBank_SourceItemKey] ON [Test].[ItemBank]
(
	[SourceItemKey] ASC,
	[SourceSystemKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]