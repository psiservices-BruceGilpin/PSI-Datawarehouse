CREATE TABLE [Test].[TopicAreaSampleGroup] (
    [SampleGroupId]       INT          IDENTITY (1, 1) NOT NULL,
    [SampleGroupDBID]     INT          NOT NULL,
    [SourceSystemKey]     SMALLINT     NOT NULL,
    [SourceSampleGroupID] VARCHAR (20) NULL,
    [TopicAreaKey]        INT          NULL,
    [SampleGroupName]     VARCHAR (50) NULL,
    [ItemCount]           INT          NULL,
    [Selectedcount]       INT          NULL,
    [CreateDate]          DATETIME     DEFAULT (getdate()) NOT NULL,
    [CurrentFlag]         BIT          DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([SampleGroupId] ASC),
    CONSTRAINT [FK_TopicAreaSampleGroup_TopicArea] FOREIGN KEY ([TopicAreaKey]) REFERENCES [Test].[PortionTopicArea] ([PortionTopicAreaId])
);


GO
CREATE NONCLUSTERED INDEX [IX_TopicAreaSampleGroup_SampleGroupBDID]
    ON [Test].[TopicAreaSampleGroup]([SampleGroupDBID] ASC) WHERE ([CurrentFlag]=(0));

