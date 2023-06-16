CREATE TABLE [Reporting].[CiscoWrapUpDetail](
	[CiscoWrapUpDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[AgentsKey] [int] NULL,
	[CallTypeKey] [int] NULL,
	[PrecisionQueueKey] [int] NULL,
	[WrapUpDataKey] [int] NULL,
	[TimeZone] [int] NULL,
	[Extension] [varchar](32) NULL,
	[DayID-CallID-SeqNo] [varchar](18) NULL,
	[CallStartDate] [date] NULL,
	[CallStartTime] [time](7) NULL,
	[CallEndDate] [date] NULL,
	[CallEndTime] [time](7) NULL,
	[CallANI] [varchar](52) NULL,
	[CalledNumber] [varchar](40) NULL,
	[TalkTime] [int] NULL,
	[HoldTime] [int] NULL,
	[WorkTime] [int] NULL,
	[RouterCallKey] [int] NULL,
	[RouterCallKeyDay] [int] NULL,
	[RunID] [int] NULL,
	[RunDate] [datetime] NULL,
	[CheckSum] [int] NULL,
 CONSTRAINT [PKCiscoWrapUpDetailID] PRIMARY KEY NONCLUSTERED 
(
	[CiscoWrapUpDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [CX_CiscoWrapUpDetail] ON [Reporting].[CiscoWrapUpDetail]
(
	[Date] ASC,
	[AgentsKey] ASC,
	[CallTypeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CiscoWrapUpDetail_Keys] ON [Reporting].[CiscoWrapUpDetail]
(
	[PrecisionQueueKey] ASC,
	[WrapUpDataKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]