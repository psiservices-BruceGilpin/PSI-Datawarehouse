CREATE TABLE [Reporting].[CiscoAgentDetailSummary](
	[CiscoAgentDetailSummaryID] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[TimeZone] [int] NULL,
	[PrecisionQueueKey] [int] NULL,
	[AgentsKey] [int] NULL,
	[CallsHandled] [int] NULL,
	[HandledCallsTime] [int] NULL,
	[ALLPQCallsHandled] [int] NULL,
	[ALLPQHandleTime] [int] NULL,
	[WrapTime] [int] NULL,
	[TalkTime] [int] NULL,
	[HoldTime] [int] NULL,
	[AvailTime] [int] NULL,
	[RunID] [int] NULL,
	[RunDate] [datetime] NULL,
	[CheckSum] [int] NULL,
 CONSTRAINT [PKCiscoAgentDetailSummaryID] PRIMARY KEY NONCLUSTERED 
(
	[CiscoAgentDetailSummaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [CX_CiscoAgentDetailSummary] ON [Reporting].[CiscoAgentDetailSummary]
(
	[Date] ASC,
	[PrecisionQueueKey] ASC,
	[AgentsKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]