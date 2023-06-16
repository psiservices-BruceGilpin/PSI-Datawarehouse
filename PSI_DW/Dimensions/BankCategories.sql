CREATE TABLE [Dimensions].[BankCategories](
	[BankCategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceBankCategoryID] [uniqueidentifier] NOT NULL,
	[BankCategoryDBId] [bigint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[BankGroupKey] [bigint] NOT NULL,
	[BankCategoryTitle] [varchar](50) NOT NULL,
	[BankCategoryDescription] [varchar](1000) NULL,
	[BankCategoryReference] [varchar](600) NULL,
	[BankCategorySequence] [int] NULL,
	[BanckCategoryStatus] [int] NOT NULL,
	[CheckSum] [bigint] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BankCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[BankCategories] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Dimensions].[BankCategories] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
CREATE NONCLUSTERED INDEX [IX_BankCategories_BankCategoriesDBID] ON [Dimensions].[BankCategories]
(
	[BankCategoryDBId] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BankCategories_BankGroupKey] ON [Dimensions].[BankCategories]
(
	[BankGroupKey] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BankCategories_CategoryTitle] ON [Dimensions].[BankCategories]
(
	[BankCategoryTitle] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]