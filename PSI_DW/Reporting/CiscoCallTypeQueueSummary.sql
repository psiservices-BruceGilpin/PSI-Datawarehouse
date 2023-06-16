CREATE TABLE [Reporting].[CiscoCallTypeQueueSummary](
	[CiscoCallTypeQueueSummaryID] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[TimeZone] [int] NULL,
	[CallTypeQueueKey] [int] NULL,
	[TotalCalls] [int] NULL,
	[1Call] [int] NULL,
	[2Calls] [int] NULL,
	[3Calls] [int] NULL,
	[4Calls] [int] NULL,
	[5Calls] [int] NULL,
	[6Calls] [int] NULL,
	[7Calls] [int] NULL,
	[8Calls] [int] NULL,
	[9Calls] [int] NULL,
	[10-14Calls] [int] NULL,
	[15-19Calls] [int] NULL,
	[20-24Calls] [int] NULL,
	[25-29Calls] [int] NULL,
	[30-39Calls] [int] NULL,
	[40-49Calls] [int] NULL,
	[50-99Calls] [int] NULL,
	[100+Calls] [int] NULL,
	[RunID] [int] NULL,
	[RunDate] [datetime] NULL,
	[CheckSum] [int] NULL,
 CONSTRAINT [PKCiscoCallTypeQueueSummaryID] PRIMARY KEY NONCLUSTERED 
(
	[CiscoCallTypeQueueSummaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [CX_CiscoCallTypeQueueSummary] ON [Reporting].[CiscoCallTypeQueueSummary]
(
	[Date] ASC,
	[CallTypeQueueKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]