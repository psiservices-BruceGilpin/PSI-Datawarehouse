CREATE TABLE [Reporting].[CiscoAgentLoginOutSummary](
	[CiscoAgentLoginOutSummaryId] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[AgentsKey] [int] NULL,
	[LoginDate] [date] NULL,
	[LoginTime] [time](7) NULL,
	[LogoutDate] [date] NULL,
	[LogoutTime] [time](7) NULL,
	[Duration] [int] NULL,
	[RunID] [int] NULL,
	[RunDate] [datetime] NULL,
	[CheckSum] [int] NULL,
 CONSTRAINT [PKCiscoAgentLoginOutSummaryId] PRIMARY KEY NONCLUSTERED 
(
	[CiscoAgentLoginOutSummaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [CX_CiscoAgentLoginOutSummary] ON [Reporting].[CiscoAgentLoginOutSummary]
(
	[Date] ASC,
	[AgentsKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]