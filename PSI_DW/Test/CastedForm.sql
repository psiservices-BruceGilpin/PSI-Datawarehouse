CREATE TABLE [Test].[CastedForm](
	[CastedFormId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceCastedFormID] [varchar](20) NOT NULL,
	[PortionKey] [int] NOT NULL,
	[TestCenterKey] [int] NOT NULL,
	[CastingType] [int] NULL,
	[CastingTrials] [int] NULL,
	[TestingDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[CastedOn] [nchar](10) NULL,
	[PartitionValue] [int] NOT NULL,
	[CastedFormDBID] [bigint] NULL,
 CONSTRAINT [PK_CastedForm] PRIMARY KEY CLUSTERED 
(
	[PartitionValue] ASC,
	[CastedFormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [CastedForm]([PartitionValue])
) ON [CastedForm]([PartitionValue])
GO
CREATE NONCLUSTERED INDEX [IX_CastedForm_PortionID] ON [Test].[CastedForm]
(
	[PortionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [CastedForm]([PartitionValue])
GO
CREATE NONCLUSTERED INDEX [IX_CastedForm_TestCenter] ON [Test].[CastedForm]
(
	[TestCenterKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [CastedForm]([PartitionValue])