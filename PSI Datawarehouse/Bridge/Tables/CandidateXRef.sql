CREATE TABLE [Bridge].[CandidateXRef] (
    [CandidateXRefId]      BIGINT        IDENTITY (1, 1) NOT NULL,
    [PDiddyCandidateKey]   VARCHAR (100) NOT NULL,
    [PDiddyExamSessionKey] VARCHAR (100) NOT NULL,
    [SourceSystemKey]      INT           NULL,
    [CandidateKey]         INT           NULL,
    [TestSessionKey]       INT           NULL,
    [RunID]                INT           NOT NULL,
    [LoadDate]             DATETIME      DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([CandidateXRefId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_CandidateXRef_CandidateKey]
    ON [Bridge].[CandidateXRef]([CandidateKey] ASC)
    INCLUDE([PDiddyCandidateKey]);


GO
CREATE NONCLUSTERED INDEX [IX_CandidateXRef_ExamSessionKey]
    ON [Bridge].[CandidateXRef]([TestSessionKey] ASC)
    INCLUDE([PDiddyExamSessionKey]);

