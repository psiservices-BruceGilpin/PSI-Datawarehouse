CREATE TABLE [Reporting].[CiscoCallTypeQueueSummary] (
    [CiscoCallTypeQueueSummaryID] BIGINT   IDENTITY (1, 1) NOT NULL,
    [Date]                        DATE     NULL,
    [TimeZone]                    INT      NULL,
    [CallTypeQueueKey]            INT      NULL,
    [TotalCalls]                  INT      NULL,
    [1Call]                       INT      NULL,
    [2Calls]                      INT      NULL,
    [3Calls]                      INT      NULL,
    [4Calls]                      INT      NULL,
    [5Calls]                      INT      NULL,
    [6Calls]                      INT      NULL,
    [7Calls]                      INT      NULL,
    [8Calls]                      INT      NULL,
    [9Calls]                      INT      NULL,
    [10-14Calls]                  INT      NULL,
    [15-19Calls]                  INT      NULL,
    [20-24Calls]                  INT      NULL,
    [25-29Calls]                  INT      NULL,
    [30-39Calls]                  INT      NULL,
    [40-49Calls]                  INT      NULL,
    [50-99Calls]                  INT      NULL,
    [100+Calls]                   INT      NULL,
    [RunID]                       INT      NULL,
    [RunDate]                     DATETIME NULL,
    [CheckSum]                    INT      NULL,
    CONSTRAINT [PKCiscoCallTypeQueueSummaryID] PRIMARY KEY NONCLUSTERED ([CiscoCallTypeQueueSummaryID] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_CiscoCallTypeQueueSummary]
    ON [Reporting].[CiscoCallTypeQueueSummary]([Date] ASC, [CallTypeQueueKey] ASC);

