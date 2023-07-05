CREATE TABLE [Test].[TopicArea]
(
	[TopicAreaId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [SourceSystemKey] SMALLINT NOT NULL, 
    [SourceTopicID] INT NOT NULL, 
    [TopicAreaDBID] INT NOT NULL, 
    [CreateDate] DATETIME NOT NULL DEFAULT getdate(), 
    [Checksum] bigint Not Null,
    [CurrentFlag] BIT NOT NULL DEFAULT 0, 
    [PortionKey] INT NOT NULL, 
    [TopicName] VARCHAR(100) NOT NULL, 
    [TopicDescription] VARCHAR(100) NULL, 
    [TopicItemCount] INT NOT NULL, 
    [TopicStatus] VARCHAR(10) NULL, 
    [SourceTAID] INT NULL, 
    [ItemWeight] DECIMAL(10, 6) NULL, 
    [TotalItemWeight] DECIMAL(10, 6) NULL, 
    [AllorNothing] BIT NOT NULL
)
