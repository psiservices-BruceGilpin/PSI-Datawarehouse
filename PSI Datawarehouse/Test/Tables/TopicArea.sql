CREATE TABLE [Test].[TopicArea] (
    [TopicAreaId]      INT             IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]  SMALLINT        NOT NULL,
    [SourceTopicID]    INT             NOT NULL,
    [TopicAreaDBID]    INT             NOT NULL,
    [CreateDate]       DATETIME        DEFAULT (getdate()) NOT NULL,
    [Checksum]         BIGINT          NOT NULL,
    [CurrentFlag]      BIT             DEFAULT ((0)) NOT NULL,
    [PortionKey]       INT             NOT NULL,
    [TopicName]        VARCHAR (100)   NOT NULL,
    [TopicDescription] VARCHAR (100)   NULL,
    [TopicItemCount]   INT             NOT NULL,
    [TopicStatus]      VARCHAR (10)    NULL,
    [SourceTAID]       INT             NULL,
    [ItemWeight]       DECIMAL (10, 6) NULL,
    [TotalItemWeight]  DECIMAL (10, 6) NULL,
    [AllorNothing]     BIT             NOT NULL,
    PRIMARY KEY CLUSTERED ([TopicAreaId] ASC)
);

