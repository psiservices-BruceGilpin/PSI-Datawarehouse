CREATE TABLE [Reporting].[CiscoPrecisionQueueSummary](
	[CiscoPrecisionQueueSummaryId] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[TimeZone] [int] NULL,
	[PrecisionQueueKey] [int] NULL,
	[TotalComplete] [int] NULL,
	[CallsAnswered] [int] NULL,
	[CallsHandled] [int] NULL,
	[AbandCalls] [int] NULL,
	[RedirectNoAnsCalls] [int] NULL,
	[RouterError] [int] NULL,
	[TransferInCalls] [int] NULL,
	[TransferOutCalls] [int] NULL,
	[ExternalOut] [int] NULL,
	[AnswerWaitTime] [int] NULL,
	[TotalHandleTime] [int] NULL,
	[AHT_CallsHandled] [int] NULL,
	[AbandonTime] [int] NULL,
	[MaxCallsQueued] [int] NULL,
	[MaxCallWaitTime] [int] NULL,
	[ServicelLevelTop] [numeric](13, 1) NULL,
	[ServicelLevelBottom] [int] NULL,
	[RunID] [int] NULL,
	[RunDate] [datetime] NULL,
	[CheckSum] [int] NULL,
 CONSTRAINT [PKCiscoPrecisionQueueSummaryId] PRIMARY KEY NONCLUSTERED 
(
	[CiscoPrecisionQueueSummaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [CX_CiscoPrecisionQueueSummary] ON [Reporting].[CiscoPrecisionQueueSummary]
(
	[Date] ASC,
	[PrecisionQueueKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]