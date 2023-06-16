CREATE TABLE [Reporting].[CiscoCSREmailDetail](
	[CiscoCSREmailDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[CaseID] [int] NULL,
	[UserKey] [bigint] NULL,
	[RoutingQueueKey] [bigint] NULL,
	[FirstCreatedDate] [date] NULL,
	[FirstCreatedTime] [time](7) NULL,
	[FirstRepliedDate] [date] NULL,
	[FirstRepliedTime] [time](7) NULL,
	[Email] [varchar](1024) NULL,
	[Subject] [varchar](1024) NULL,
	[HourFirstReply] [int] NULL,
	[RunID] [int] NULL,
	[RunDate] [datetime] NULL,
	[CheckSum] [int] NULL,
 CONSTRAINT [PKCiscoCSREmailDetailID] PRIMARY KEY NONCLUSTERED 
(
	[CiscoCSREmailDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [CX_CiscoCSREmailDetail] ON [Reporting].[CiscoCSREmailDetail]
(
	[CaseID] ASC,
	[FirstCreatedDate] ASC,
	[FirstCreatedTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CiscoCSREmailDetail_Keys] ON [Reporting].[CiscoCSREmailDetail]
(
	[UserKey] ASC,
	[RoutingQueueKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]