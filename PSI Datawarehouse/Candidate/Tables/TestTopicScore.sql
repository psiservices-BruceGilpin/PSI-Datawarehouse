CREATE TABLE [Candidate].[TestTopicScore] (
    [TestTopicScoreId]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]    SMALLINT        NOT NULL,
    [SourceTopicScoreID] VARCHAR (20)    NOT NULL,
    [TestTopicScoreDbID] BIGINT          NOT NULL,
    [CurrentFlag]        BIT             DEFAULT ((0)) NOT NULL,
    [CreateDate]         DATETIME        DEFAULT (getdate()) NOT NULL,
    [Checksum]           BIGINT          NOT NULL,
    [TestAssignmentKey]  BIGINT          NOT NULL,
    [TopicName]          VARCHAR (125)   NULL,
    [CorrectItemCount]   INT             NOT NULL,
    [TotalScore]         DECIMAL (10, 6) NULL,
    [TotalItemCount]     INT             NULL,
    [ItemWeight]         DECIMAL (10, 6) NULL,
    PRIMARY KEY CLUSTERED ([TestTopicScoreId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_TestTopicScore_CurrentFlag]
    ON [Candidate].[TestTopicScore]([CurrentFlag] ASC)
    INCLUDE([TestAssignmentKey]);


GO
CREATE NONCLUSTERED INDEX [IX_TestTopicScore_TestAssignmentKey]
    ON [Candidate].[TestTopicScore]([TestAssignmentKey] ASC) WHERE ([CurrentFlag]=(0));

