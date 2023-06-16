CREATE TABLE [Cisco].[GemStoneLookup](
	[GemStoneLookupID] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](10) NULL,
	[Queue] [varchar](65) NULL,
	[Tier] [varchar](20) NULL
) ON [PRIMARY]