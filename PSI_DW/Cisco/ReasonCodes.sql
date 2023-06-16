CREATE TABLE [Cisco].[ReasonCodes](
	[ReasonCodesId] [bigint] IDENTITY(1,1) NOT NULL,
	[ReasonCode] [int] NULL,
	[SourceSystemKey] [int] NULL,
	[Description] [varchar](50) NULL,
	[NotReady] [bit] NULL,
	[Approved] [bit] NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[CheckSum] [int] NULL,
	[EffectiveTo] [datetime] NULL,
 CONSTRAINT [PKReasonCodesId] PRIMARY KEY CLUSTERED 
(
	[ReasonCodesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[ReasonCodes] ADD  CONSTRAINT [dfReasonCodesEffectiveTo]  DEFAULT ('2999-12-31') FOR [EffectiveTo]
GO
CREATE NONCLUSTERED INDEX [IX_ReasonCodes_ReasonCode] ON [Cisco].[ReasonCodes]
(
	[ReasonCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]