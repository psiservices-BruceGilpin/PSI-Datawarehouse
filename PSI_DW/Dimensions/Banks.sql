CREATE TABLE [Dimensions].[Banks](
	[BankId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceBankKey] [uniqueidentifier] NOT NULL,
	[BankDBID] [bigint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[AreaKey] [bigint] NOT NULL,
	[BankTitle] [varchar](50) NOT NULL,
	[BankDescription] [varchar](2000) NULL,
	[BankSim] [bit] NULL,
	[BankCopyright] [varchar](255) NULL,
	[EnforceOutline] [bit] NULL,
	[BankSequenceLenth] [smallint] NULL,
	[isDeleted] [bit] NULL,
	[Checksum] [bigint] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[Banks] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Dimensions].[Banks] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
CREATE NONCLUSTERED INDEX [IX_Banks_Area] ON [Dimensions].[Banks]
(
	[AreaKey] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Banks_BankDBID] ON [Dimensions].[Banks]
(
	[BankDBID] ASC
)
INCLUDE([BankTitle]) 
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Banks_BankTitle] ON [Dimensions].[Banks]
(
	[BankTitle] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]