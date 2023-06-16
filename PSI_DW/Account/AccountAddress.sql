CREATE TABLE [Account].[AccountAddress](
	[AccountAddressId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[AccountKey] [int] NOT NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](30) NULL,
	[AddressType] [varchar](30) NULL,
	[Checksum] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[RunID] [int] NOT NULL,
	[AccountAddressDBId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Account].[AccountAddress]  WITH CHECK ADD  CONSTRAINT [FK_AccountAddress_Accounts] FOREIGN KEY([AccountKey])
REFERENCES [Account].[Accounts] ([AccountId])
GO

ALTER TABLE [Account].[AccountAddress] CHECK CONSTRAINT [FK_AccountAddress_Accounts]
GO
ALTER TABLE [Account].[AccountAddress] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [Account].[AccountAddress] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_AccountAddress_AccountAddressDBID] ON [Account].[AccountAddress]
(
	[AccountAddressDBId] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AccountAddress_AccountKey] ON [Account].[AccountAddress]
(
	[AccountKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]