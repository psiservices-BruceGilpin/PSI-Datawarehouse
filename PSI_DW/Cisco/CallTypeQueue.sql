﻿CREATE TABLE [Cisco].[CallTypeQueue](
	[CallTypeQueueID] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [int] NULL,
	[CallQueue] [varchar](72) NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[CheckSum] [int] NULL,
	[EffectiveTo] [datetime] NULL,
 CONSTRAINT [PKCallTypeQueueID] PRIMARY KEY CLUSTERED 
(
	[CallTypeQueueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[CallTypeQueue] ADD  CONSTRAINT [dfCallTypeQueueEffectiveTo]  DEFAULT ('2999-12-31') FOR [EffectiveTo]
GO
CREATE NONCLUSTERED INDEX [IX_CallTypeQueue_CallQueue] ON [Cisco].[CallTypeQueue]
(
	[CallQueue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]