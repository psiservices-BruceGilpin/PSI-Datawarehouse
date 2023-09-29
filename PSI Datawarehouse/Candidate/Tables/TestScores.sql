CREATE TABLE [Candidate].[TestScores] (
    [TestScoreId]       INT             IDENTITY (1, 1) NOT NULL,
    [TestScoreDBID]     INT             NOT NULL,
    [SourceSystemKey]   INT             NOT NULL,
    [SourceSystemID]    VARCHAR (20)    NOT NULL,
    [TestAssignmentKey] INT             NOT NULL,
    [RawScore]          DECIMAL (10, 6) NULL,
    [ScaleScore]        DECIMAL (10, 6) NULL,
    [Result]            VARCHAR (20)    NULL,
    [ScoreType]         VARCHAR (20)    NULL,
    [ScoreDate]         DATETIME        NULL,
    [CreatedDate]       DATETIME        DEFAULT (getdate()) NOT NULL,
    [CurrentFlag]       BIT             DEFAULT ((0)) NOT NULL,
    [Checksum]          INT             NULL,
    PRIMARY KEY CLUSTERED ([TestScoreId] ASC),
    CONSTRAINT [FK_TestScores_TestAssignment] FOREIGN KEY ([TestAssignmentKey]) REFERENCES [Candidate].[TestAssignments] ([TestAssignmentId])
);


GO
CREATE NONCLUSTERED INDEX [IX_TestScores_TestAssignmentKey]
    ON [Candidate].[TestScores]([TestAssignmentKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TestScores_TestScoreDBID]
    ON [Candidate].[TestScores]([TestScoreDBID] ASC) WHERE ([Currentflag]=(0));

