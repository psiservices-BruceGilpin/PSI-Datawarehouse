CREATE TABLE [Cisco].[HCSCDR](
	[HCSCDRID] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[SourceSystemKey] [int] NULL,
	[CdrID] [int] NULL,
	[OrginationDate] [date] NULL,
	[OrginationTime] [time](7) NULL,
	[ConnectDate] [date] NULL,
	[ConnectTime] [time](7) NULL,
	[DisconnectDate] [date] NULL,
	[DisconnectTime] [time](7) NULL,
	[GlobalCallIDCallId] [int] NULL,
	[OrigLegCallIdentifier] [int] NULL,
	[DestLegIdentifier] [int] NULL,
	[CallingPartyNumber] [varchar](50) NULL,
	[OriginalCalledPartyNumber] [varchar](50) NULL,
	[FinalCalledPartyNumber] [varchar](50) NULL,
	[LastRedirectDn] [varchar](50) NULL,
	[Duration] [int] NULL,
	[OrigCauseValue] [int] NULL,
	[DestCauseValue] [int] NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[CheckSum] [int] NULL,
	[EffectiveTo] [datetime] NULL,
 CONSTRAINT [PKHCSCDRID] PRIMARY KEY NONCLUSTERED 
(
	[HCSCDRID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[HCSCDR] ADD  CONSTRAINT [dfEffectiveToHCSCDR]  DEFAULT ('2099/12/31') FOR [EffectiveTo]
GO
CREATE CLUSTERED INDEX [CX_HCSCDR] ON [Cisco].[HCSCDR]
(
	[Date] ASC,
	[CdrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_HCSCDR_GlobalCallIDCallId] ON [Cisco].[HCSCDR]
(
	[GlobalCallIDCallId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]