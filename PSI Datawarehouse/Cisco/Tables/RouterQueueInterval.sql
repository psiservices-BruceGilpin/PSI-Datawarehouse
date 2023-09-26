CREATE TABLE [Cisco].[RouterQueueInterval] (
    [RouterQueueIntervalID]    BIGINT   IDENTITY (1, 1) NOT NULL,
    [DATE]                     DATE     NULL,
    [Time]                     TIME (7) NULL,
    [PrecisionQueueKey]        INT      NULL,
    [SourceSystemKey]          INT      NULL,
    [TimeZone]                 INT      NULL,
    [QueueCalls]               INT      NULL,
    [CallsAbandQ]              INT      NULL,
    [CallsOffered]             INT      NULL,
    [CallsAbandToAgent]        INT      NULL,
    [CallsDequeued]            INT      NULL,
    [RouterError]              INT      NULL,
    [ServiceLevel]             REAL     NULL,
    [ServiceLevelCalls]        INT      NULL,
    [ServiceLevelRONA]         INT      NULL,
    [ServiceLevelCallsOffered] INT      NULL,
    [ServiceLevelCallsAband]   INT      NULL,
    [ServiceLevelCallsDequeue] INT      NULL,
    [ServiceLevelError]        INT      NULL,
    [DelayQAbandTime]          INT      NULL,
    [MaxCallsQueued]           INT      NULL,
    [MaxCallWaitTime]          INT      NULL,
    [CallsAbandDequeued]       INT      NULL,
    [ReportingHalfHour]        INT      NULL,
    [ReportingInterval]        INT      NULL,
    [BucketIntervalID]         INT      NULL,
    [RoutedToAgent]            INT      NULL,
    [CallsAnswered]            INT      NULL,
    [FutureUseInt1]            INT      NULL,
    [FutureUseInt2]            INT      NULL,
    [RunID]                    INT      NULL,
    [EffectiveFrom]            DATETIME NULL,
    [CheckSum]                 INT      NULL,
    [EffectiveTo]              DATETIME CONSTRAINT [dfRouterQueueIntervalEffectiveTo] DEFAULT ('2999-12-31') NULL,
    CONSTRAINT [PKRouterQueueIntervalID] PRIMARY KEY NONCLUSTERED ([RouterQueueIntervalID] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_RouterQueueInterval]
    ON [Cisco].[RouterQueueInterval]([DATE] ASC, [Time] ASC, [PrecisionQueueKey] ASC);

