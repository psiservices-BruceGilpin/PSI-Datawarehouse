CREATE TABLE [Cisco].[CallType](
	[CallTypeID] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemCallTypeKey] [int] NULL,
	[SourceSystemKey] [int] NULL,
	[EnterpriseName] [varchar](52) NULL,
	[Description] [varchar](134) NULL,
	[ServiceLevelThreshold] [int] NULL,
	[ServiceLevelType] [smallint] NULL,
	[IsDeleted] [char](1) NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[EffectiveTo] [datetime] NULL,
	[CheckSum] [int] NULL,
 CONSTRAINT [PKCallTypeID] PRIMARY KEY CLUSTERED 
(
	[CallTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[CallType] ADD  CONSTRAINT [dfCallTypeEffectiveTo]  DEFAULT ('2999-12-31') FOR [EffectiveTo]
GO
CREATE NONCLUSTERED INDEX [IX_CallType_SourceSystemCallTypeKey] ON [Cisco].[CallType]
(
	[SourceSystemCallTypeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]