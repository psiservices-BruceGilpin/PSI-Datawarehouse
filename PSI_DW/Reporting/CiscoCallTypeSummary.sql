CREATE TABLE [Reporting].[CiscoCallTypeSummary](
	[CiscoCallTypeSummaryID] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[CallTypeKey] [int] NULL,
	[TimeZone] [int] NULL,
	[AnswerWaitTime] [int] NULL,
	[CallAnswered] [int] NULL,
	[CallDelayAbandTime] [numeric](13, 1) NULL,
	[CallsHandled] [int] NULL,
	[CallsOffered] [int] NULL,
	[HandleTime] [int] NULL,
	[MaxCallWaitTime] [int] NULL,
	[MinQueueTime] [int] NULL,
	[OverflowOut] [int] NULL,
	[ServicelLevelDeNom] [int] NULL,
	[ServicelLevelNum] [numeric](13, 1) NULL,
	[TotalCallsAband] [numeric](13, 1) NULL,
	[TotalCallsAbandDenom] [int] NULL,
	[IncompleteCalls] [int] NULL,
	[ServiceLevelError] [int] NULL,
	[RONA] [int] NULL,
	[SLThreshold] [int] NULL,
	[RunID] [int] NULL,
	[RunDate] [datetime] NULL,
	[CheckSum] [int] NULL,
 CONSTRAINT [PKCiscoCallTypeSummaryID] PRIMARY KEY NONCLUSTERED 
(
	[CiscoCallTypeSummaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [CX_CiscoCallTypeSummary] ON [Reporting].[CiscoCallTypeSummary]
(
	[Date] ASC,
	[CallTypeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]