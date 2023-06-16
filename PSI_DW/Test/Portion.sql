CREATE TABLE [Test].[Portion](
	[PortionId] [int] IDENTITY(1,1) NOT NULL,
	[SourcePortionKey] [varchar](20) NULL,
	[SourceSystemKey] [int] NULL,
	[TestKey] [int] NOT NULL,
	[PortionName] [varchar](100) NOT NULL,
	[TestOrder] [tinyint] NULL,
	[Description] [varchar](50) NULL,
	[IsScored] [bit] NULL,
	[MinItemCount] [int] NULL,
	[Duration] [int] NULL,
	[PassingScore] [decimal](10, 6) NULL,
	[ScaledCut] [int] NULL,
	[CastingTrials] [int] NULL,
	[CastingTypeKey] [int] NULL,
	[CastingModel] [varchar](20) NULL,
	[ItemsToBeShown] [int] NULL,
	[IsTimed] [bit] NULL,
	[TotalItemWeight] [decimal](10, 6) NULL,
	[TopicGroupingType] [int] NULL,
	[IVRPortionName] [varchar](100) NULL,
	[GroupLevelScoring] [bit] NULL,
	[FirstFormRandom] [bit] NULL,
	[VariableCutScores] [bit] NULL,
	[ClientCode] [varchar](50) NULL,
	[PortionDBID] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[CurrentFlag] [bit] NOT NULL,
	[RawCut] [decimal](10, 6) NULL,
	[Checksum] [int] NULL,
	[PortionTypeKey] [tinyint] NULL,
	[ItemCount] [int] NULL,
 CONSTRAINT [PKPortionId] PRIMARY KEY CLUSTERED 
(
	[PortionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[Portion]  WITH CHECK ADD  CONSTRAINT [FK_Portion_Tests] FOREIGN KEY([TestKey])
REFERENCES [Test].[Tests] ([TestId])
GO

ALTER TABLE [Test].[Portion] CHECK CONSTRAINT [FK_Portion_Tests]
GO
ALTER TABLE [Test].[Portion] ADD  CONSTRAINT [dfCreateDatePortion]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [Test].[Portion] ADD  CONSTRAINT [dfCreateDateCurrentFlag]  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_Portion_PortionDBID] ON [Test].[Portion]
(
	[PortionDBID] ASC
)
WHERE ([currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Portion_SourcePortionKey] ON [Test].[Portion]
(
	[SourcePortionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Portion_TestKey] ON [Test].[Portion]
(
	[TestKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]