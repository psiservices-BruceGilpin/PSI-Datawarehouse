CREATE TABLE [Candidate].[TestTopicScore]
(
	[TestTopicScoreId] BIGINT NOT NULL PRIMARY KEY, 
    [SourceSystemKey] SMALLINT NOT NULL, 
    [SourceTopicScoreID] VARCHAR(20) NOT NULL, 
    [TestTopicScoreDbID] BIGINT NOT NULL, 
    [CurrentFlag] BIT NOT NULL DEFAULT 0, 
    [CreateDate] DATETIME NOT NULL DEFAULT getdate(), 
    [Checksum] BIGINT NOT NULL, 
    [TestAssignmentKey] BIGINT Not Null,
    [TopicName] VARCHAR(125) NULL, 
    [CorrectItemCount] INT NOT NULL, 
    [TotalScore] DECIMAL(10, 6) NULL, 
    [TotalItemCount] INT NULL, 
    [ItemWeight] DECIMAL(10, 6) NULL
)

GO

CREATE INDEX [IX_TestTopicScore_CurrentFlag] ON [Candidate].[TestTopicScore] ([CurrentFlag])
Include (TestAssignmentKey)

GO

CREATE INDEX [IX_TestTopicScore_TestAssignmentKey] ON [Candidate].[TestTopicScore] ([TestAssignmentKey])
where CurrentFlag = 0
