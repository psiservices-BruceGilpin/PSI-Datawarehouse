CREATE TABLE [Global].[CandidateResponses] (
    [CandidateResponseId] INT          NOT NULL,
    [DWSourceTable]       VARCHAR (50) NOT NULL,
    [DWSourceKey]         BIGINT       NOT NULL,
    [CurrentFlag]         BIT          DEFAULT ((0)) NOT NULL,
    [CreateDate]          DATETIME     DEFAULT (getdate()) NOT NULL,
    [Checksum]            BIGINT       NOT NULL,
    [DWSourceQuestionKey] BIGINT       NOT NULL,
    [DWSourceResponseKey] BIGINT       NOT NULL,
    [DWTestSectionKey]    BIGINT       NOT NULL,
    [Correct]             BIGINT       NULL,
    PRIMARY KEY CLUSTERED ([CandidateResponseId] ASC)
);

