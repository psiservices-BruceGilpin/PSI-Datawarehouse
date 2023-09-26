CREATE TABLE [Staging].[StagingCandidateXRef] (
    [PDiddyCandidateKey]   VARCHAR (100) NOT NULL,
    [PDiddyExamSessionKey] VARCHAR (100) NOT NULL,
    [SourceSystemKey]      INT           NULL,
    [CandidateKey]         INT           NULL,
    [TestSessionKey]       INT           NULL,
    [RunID]                INT           NOT NULL
);


GO
CREATE CLUSTERED INDEX [CX_StagingCandidateXRef]
    ON [Staging].[StagingCandidateXRef]([PDiddyCandidateKey] ASC, [PDiddyExamSessionKey] ASC);

