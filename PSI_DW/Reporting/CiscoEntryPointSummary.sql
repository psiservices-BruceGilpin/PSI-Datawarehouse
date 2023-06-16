CREATE TABLE [Reporting].[CiscoEntryPointSummary](
	[CiscoEntryPointSummaryId] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[EntryPointKey] [int] NULL,
	[OfferedChats] [int] NULL,
	[AbandonedChats] [int] NULL,
	[ServicedChats] [int] NULL,
	[ServicedChattingTime] [int] NULL,
	[ServicedWrapUPTime] [int] NULL,
	[WrapUpChats] [int] NULL,
	[ServicedChatDurationTime] [int] NULL,
	[ServicedWaitTime] [int] NULL,
	[TotalAbandonedTime] [int] NULL,
	[RunID] [int] NULL,
	[RunDate] [datetime] NULL,
	[CheckSum] [int] NULL,
 CONSTRAINT [PKCiscoEntryPointSummaryId] PRIMARY KEY NONCLUSTERED 
(
	[CiscoEntryPointSummaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [CX_CiscoEntryPointSummary] ON [Reporting].[CiscoEntryPointSummary]
(
	[Date] ASC,
	[EntryPointKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]