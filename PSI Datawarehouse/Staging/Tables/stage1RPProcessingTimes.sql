CREATE TABLE [Staging].[stage1RPProcessingTimes] (
    [OrganizationName]        VARCHAR (255) NULL,
    [pDiddy]                  VARCHAR (296) NULL,
    [EventAssigning]          VARCHAR (255) NULL,
    [EventAssigningIdx]       BIGINT        NULL,
    [EventAssigningStartTime] DATETIME      NULL,
    [EventStarted]            VARCHAR (255) NULL,
    [EventStartedIdx]         BIGINT        NULL,
    [EventStartedTime]        DATETIME      NULL,
    [IdxDiff]                 BIGINT        NULL,
    [TotalTimeSeconds]        INT           NULL,
    [TotalTimeMin]            FLOAT (53)    NULL,
    [ProcessingMonth]         INT           NULL,
    [ProcessingDay]           INT           NULL,
    [Step]                    VARCHAR (255) NULL
);


GO
CREATE CLUSTERED INDEX [IX_stage1RPProcessingTimes_pDiddy]
    ON [Staging].[stage1RPProcessingTimes]([pDiddy] ASC);

