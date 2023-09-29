CREATE TABLE [Staging].[StagingCandidateTestScores] (
    [SourceSystemKey]   INT             NOT NULL,
    [SourceSystemID]    VARCHAR (20)    NOT NULL,
    [TestAssignmentKey] INT             NOT NULL,
    [RawScore]          DECIMAL (10, 6) NULL,
    [ScaleScore]        DECIMAL (10, 6) NULL,
    [Result]            VARCHAR (20)    NULL,
    [ScoreType]         VARCHAR (20)    NULL,
    [ScoreDate]         DATETIME        NULL,
    [CheckSum]          BIGINT          NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_StagingCandidateTestScores_Column]
    ON [Staging].[StagingCandidateTestScores]([SourceSystemID] ASC, [TestAssignmentKey] ASC);

