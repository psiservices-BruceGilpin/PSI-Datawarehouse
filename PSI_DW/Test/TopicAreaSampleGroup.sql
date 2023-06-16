CREATE TABLE [Test].[TopicAreaSampleGroup](
	[SampleGroupId] [int] IDENTITY(1,1) NOT NULL,
	[SampleGroupDBID] [int] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSampleGroupID] [varchar](20) NULL,
	[TopicAreaKey] [int] NULL,
	[SampleGroupName] [varchar](50) NULL,
	[ItemCount] [int] NULL,
	[Selectedcount] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SampleGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[TopicAreaSampleGroup]  WITH CHECK ADD  CONSTRAINT [FK_TopicAreaSampleGroup_TopicArea] FOREIGN KEY([TopicAreaKey])
REFERENCES [Test].[PortionTopicArea] ([PortionTopicAreaId])
GO

ALTER TABLE [Test].[TopicAreaSampleGroup] CHECK CONSTRAINT [FK_TopicAreaSampleGroup_TopicArea]
GO
ALTER TABLE [Test].[TopicAreaSampleGroup] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [Test].[TopicAreaSampleGroup] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_TopicAreaSampleGroup_SampleGroupBDID] ON [Test].[TopicAreaSampleGroup]
(
	[SampleGroupDBID] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]