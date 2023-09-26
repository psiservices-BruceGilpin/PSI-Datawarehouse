CREATE TABLE [Staging].[StagingRPProcessingTimes] (
    [OrganizationKey]         INT        NULL,
    [EventStepsKey]           INT        NULL,
    [CandidateXRefKey]        BIGINT     NULL,
    [Date]                    DATE       NULL,
    [EventAssigningIdx]       BIGINT     NULL,
    [EventAssigningStartTime] DATETIME   NULL,
    [EventStartedIdx]         BIGINT     NULL,
    [EventStartedTime]        DATETIME   NULL,
    [IdxDiff]                 BIGINT     NULL,
    [TotalTimeSeconds]        INT        NULL,
    [TotalTimeMin]            FLOAT (53) NULL,
    [ProcessingMonth]         INT        NULL,
    [ProcessingDay]           INT        NULL,
    [Checksum]                INT        NOT NULL,
    [RunDate]                 DATETIME   NULL,
    [RunID]                   INT        NOT NULL
);


GO
CREATE CLUSTERED INDEX [CX_StagingRPProcessingTimes]
    ON [Staging].[StagingRPProcessingTimes]([OrganizationKey] ASC, [EventStepsKey] ASC, [CandidateXRefKey] ASC, [Date] ASC);

