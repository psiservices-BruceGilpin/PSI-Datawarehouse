CREATE TABLE [Test].[PortionTopicArea] (
    [PortionTopicAreaId]   INT             IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]      INT             NOT NULL,
    [SourceTopicAreaID]    VARCHAR (20)    NOT NULL,
    [PortionKey]           INT             NOT NULL,
    [TopicName]            VARCHAR (100)   NOT NULL,
    [TopicAreaDescription] VARCHAR (50)    NULL,
    [ItemCount]            INT             NOT NULL,
    [PublicationStatus]    VARCHAR (6)     NULL,
    [ItemWeight]           DECIMAL (10, 6) NULL,
    [SequenceNo]           INT             NULL,
    [AllOrNothingFlag]     BIT             NOT NULL,
    [CreateDate]           DATETIME        NOT NULL,
    [CurrentFlag]          BIT             NOT NULL,
    [CheckSum]             INT             NOT NULL,
    [PortionTopicAreaDBID] INT             NULL,
    PRIMARY KEY CLUSTERED ([PortionTopicAreaId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_PortionTopicArea_TestKeyPortionKey]
    ON [Test].[PortionTopicArea]([PortionKey] ASC);

