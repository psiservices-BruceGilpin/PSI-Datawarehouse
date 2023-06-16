CREATE TABLE [Account].[Accounts](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[SourceAccountID] [varchar](20) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[BridgeOrganizationKey] [int] NULL,
	[AccountName] [varchar](100) NOT NULL,
	[AccountType] [varchar](20) NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[TerminationDate] [datetime] NULL,
	[PreviousStatus] [varchar](20) NULL,
	[IsDeleted] [bit] NULL,
	[AliasName] [varchar](250) NULL,
	[ClientCode] [varchar](50) NULL,
	[GlobalAccountID] [varchar](20) NOT NULL,
	[AccountPrefix] [varchar](3) NULL,
	[CheckSum] [bigint] NOT NULL,
	[RunID] [int] NOT NULL,
	[AccountDBID] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Account].[Accounts] ADD  DEFAULT ('UNK') FOR [AccountType]
GO
ALTER TABLE [Account].[Accounts] ADD  DEFAULT ('UNK') FOR [Status]
GO
ALTER TABLE [Account].[Accounts] ADD  DEFAULT ('UNK') FOR [GlobalAccountID]
GO
ALTER TABLE [Account].[Accounts] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [Account].[Accounts] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_Accounts_AccountDBID] ON [Account].[Accounts]
(
	[AccountDBID] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Accounts_SourceAccountID] ON [Account].[Accounts]
(
	[SourceAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]