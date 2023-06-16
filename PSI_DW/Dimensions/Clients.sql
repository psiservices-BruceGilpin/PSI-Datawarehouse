CREATE TABLE [Dimensions].[Clients](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[ClientDBID] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Code] [varchar](16) NOT NULL,
	[Description] [varchar](256) NOT NULL,
	[AtlasAccountCode] [varchar](32) NOT NULL,
	[AtlasAccountID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[Clients] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Dimensions].[Clients] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
CREATE NONCLUSTERED INDEX [IX_Clients_CurrentFlag] ON [Dimensions].[Clients]
(
	[CurrentFlag] ASC
)
INCLUDE([ClientDBID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]