CREATE TABLE [Cisco].[Customers](
	[CustomersID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [varchar](75) NULL,
	[CustomerName] [varchar](75) NULL,
	[SourceSystemKey] [int] NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[CheckSum] [int] NULL,
	[EffectiveTo] [datetime] NULL,
 CONSTRAINT [PKCustomersID] PRIMARY KEY CLUSTERED 
(
	[CustomersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[Customers] ADD  CONSTRAINT [dfCustomersEffectiveTo]  DEFAULT ('2999-12-31') FOR [EffectiveTo]
GO
CREATE NONCLUSTERED INDEX [IX_Customers_EmailCustomerName] ON [Cisco].[Customers]
(
	[EmailAddress] ASC,
	[CustomerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]