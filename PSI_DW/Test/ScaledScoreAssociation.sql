CREATE TABLE [Test].[ScaledScoreAssociation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemMappingID] [int] NOT NULL,
	[ScaledScoreAssnDBID] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[PortionKey] [bigint] NOT NULL,
	[FormKey] [bigint] NOT NULL,
	[SCName] [varchar](100) NOT NULL,
	[RawScore] [decimal](10, 3) NOT NULL,
	[ScaledScore] [decimal](10, 3) NOT NULL,
	[Checksum] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ScaledScoreAssociation_FormKey] ON [Test].[ScaledScoreAssociation]
(
	[FormKey] ASC
)
INCLUDE([PortionKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ScaledScoreAssociation_PortionKey] ON [Test].[ScaledScoreAssociation]
(
	[PortionKey] ASC
)
INCLUDE([FormKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]