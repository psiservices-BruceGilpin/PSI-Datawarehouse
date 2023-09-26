CREATE TABLE [GlobalTestResults].[ScheduledCandidates] (
    [ScheduledCandidateId] BIGINT     IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]      SMALLINT   NOT NULL,
    [DWCandidateKey]       BIGINT     NOT NULL,
    [TestScheduleKey]      BIGINT     NOT NULL,
    [LoadDate]             DATETIME   DEFAULT (getdate()) NOT NULL,
    [RawScore]             INT        NOT NULL,
    [PassFail]             BIT        NOT NULL,
    [Reapplicant]          NCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([ScheduledCandidateId] ASC)
);

