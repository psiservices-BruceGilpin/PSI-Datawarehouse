CREATE TABLE [Dimensions].[BankCategoryGroups](
	[BankCategoryGroupId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceBankCatGroupID] [uniqueidentifier] NOT NULL,
	[BankCategoryGroupDBID] [bigint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[BankKey] [bigint] NOT NULL,
	[BankCatGroupTitle] [varchar](50) NOT NULL,
	[BankCatGroupDesc] [varchar](600) NULL,
	[GroupTag] [varchar](50) NULL,
	[PreTest] [bit] NOT NULL,
	[BankCatGroupSequence] [int] NULL,
	[BankCatStatus] [bit] NOT NULL,
	[Checksum] [bigint] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BankCategoryGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[BankCategoryGroups] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Dimensions].[BankCategoryGroups] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
CREATE NONCLUSTERED INDEX [IX_BankCategoryGroups_BankCategoryKey] ON [Dimensions].[BankCategoryGroups]
(
	[BankKey] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BankCategoryGroups_CategoryGroupDBID] ON [Dimensions].[BankCategoryGroups]
(
	[BankCategoryGroupDBID] ASC
)
INCLUDE([BankCatGroupTitle]) 
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]