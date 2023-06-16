CREATE TABLE [Cisco].[RouteCallDetail](
	[RouteCallDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[DialedNumberID] [int] NULL,
	[SourceSystemKey] [int] NULL,
	[RouterCallKeyDay] [int] NULL,
	[RouterCallKey] [int] NULL,
	[Date] [date] NULL,
	[Time] [time](7) NULL,
	[BeganRoutingDate] [date] NULL,
	[BeganCallTypeDate] [time](7) NULL,
	[BeganRoutingTime] [date] NULL,
	[BeganCallTypeTime] [time](7) NULL,
	[RequestType] [smallint] NULL,
	[RoutingClientID] [smallint] NULL,
	[OriginatorType] [smallint] NULL,
	[RoutingClientCallKey] [int] NULL,
	[MsgOrigin] [smallint] NULL,
	[Variable1] [varchar](40) NULL,
	[Variable2] [varchar](40) NULL,
	[Variable3] [varchar](40) NULL,
	[Variable4] [varchar](40) NULL,
	[Variable5] [varchar](40) NULL,
	[ANI] [varchar](32) NULL,
	[CED] [varchar](30) NULL,
	[CallSegmentTime] [int] NULL,
	[CallTypeKey] [int] NULL,
	[RouterErrorCode] [smallint] NULL,
	[RecoveryDay] [int] NULL,
	[TimeZone] [int] NULL,
	[Originator] [varchar](8) NULL,
	[Variable6] [varchar](40) NULL,
	[Variable7] [varchar](40) NULL,
	[Variable8] [varchar](40) NULL,
	[Variable9] [varchar](40) NULL,
	[Variable10] [varchar](40) NULL,
	[RouterCallKeySequenceNumber] [int] NULL,
	[RouterQueueTime] [int] NULL,
	[VruScripts] [int] NULL,
	[Label] [varchar](32) NULL,
	[TargetLabel] [varchar](32) NULL,
	[DialedNumberString] [varchar](32) NULL,
	[TargetType] [int] NULL,
	[MRDomainKey] [bigint] NULL,
	[RequeryResult] [int] NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[CheckSum] [int] NULL,
	[EffectiveTo] [datetime] NULL,
 CONSTRAINT [PKRouteCallDetailId] PRIMARY KEY NONCLUSTERED 
(
	[RouteCallDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[RouteCallDetail] ADD  CONSTRAINT [dfRouteCallDetailEffectiveTo]  DEFAULT ('2999-12-31') FOR [EffectiveTo]
GO
CREATE CLUSTERED INDEX [CX_RouteCallDetail] ON [Cisco].[RouteCallDetail]
(
	[RouterCallKey] ASC,
	[Date] ASC,
	[Time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_RouteCallDetail_CallTypeKey] ON [Cisco].[RouteCallDetail]
(
	[CallTypeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]