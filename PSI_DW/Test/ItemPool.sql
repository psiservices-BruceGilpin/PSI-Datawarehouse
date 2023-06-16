CREATE TABLE [Test].[ItemPool](
	[ItemPoolId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[PortionKey] [int] NOT NULL,
	[ItemKey] [int] NOT NULL,
	[MinWeightage] [decimal](10, 6) NULL,
	[ItemWeightage] [decimal](10, 6) NULL,
	[Pvalue] [decimal](9, 4) NULL,
	[Pbis] [decimal](9, 4) NULL,
	[AngoffValue] [decimal](9, 4) NULL,
	[IsRecorded] [bit] NULL,
	[IsTimed] [bit] NULL,
	[IsScored] [bit] NULL,
	[ItemPoolStatusKey] [int] NULL,
	[IsFromQorNQ] [bit] NULL,
	[ActiveIsg] [int] NULL,
	[Subtopic] [varchar](50) NULL,
	[Checksum] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CurentFlag] [bit] NOT NULL,
	[ItemPoolDBID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemPoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[ItemPool]  WITH CHECK ADD  CONSTRAINT [FK_ItemPool_ItemBank] FOREIGN KEY([ItemKey])
REFERENCES [Test].[ItemBank] ([ItemBankId])
GO

ALTER TABLE [Test].[ItemPool] CHECK CONSTRAINT [FK_ItemPool_ItemBank]
GO
ALTER TABLE [Test].[ItemPool]  WITH CHECK ADD  CONSTRAINT [FK_ItemPool_TestPortion] FOREIGN KEY([PortionKey])
REFERENCES [Test].[Portion] ([PortionId])
GO

ALTER TABLE [Test].[ItemPool] CHECK CONSTRAINT [FK_ItemPool_TestPortion]
GO
ALTER TABLE [Test].[ItemPool] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [Test].[ItemPool] ADD  DEFAULT ((0)) FOR [CurentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_ItemPool_ItemKey] ON [Test].[ItemPool]
(
	[ItemKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemPool_ItemPoolDBID] ON [Test].[ItemPool]
(
	[ItemPoolDBID] ASC
)
WHERE ([CurentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemPool_PortionKey] ON [Test].[ItemPool]
(
	[PortionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]