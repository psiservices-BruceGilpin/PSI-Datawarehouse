CREATE TABLE [Reporting].[CiscoPrecisionQueueSummary] (
    [CiscoPrecisionQueueSummaryId] BIGINT          IDENTITY (1, 1) NOT NULL,
    [Date]                         DATE            NULL,
    [TimeZone]                     INT             NULL,
    [PrecisionQueueKey]            INT             NULL,
    [TotalComplete]                INT             NULL,
    [CallsAnswered]                INT             NULL,
    [CallsHandled]                 INT             NULL,
    [AbandCalls]                   INT             NULL,
    [RedirectNoAnsCalls]           INT             NULL,
    [RouterError]                  INT             NULL,
    [TransferInCalls]              INT             NULL,
    [TransferOutCalls]             INT             NULL,
    [ExternalOut]                  INT             NULL,
    [AnswerWaitTime]               INT             NULL,
    [TotalHandleTime]              INT             NULL,
    [AHT_CallsHandled]             INT             NULL,
    [AbandonTime]                  INT             NULL,
    [MaxCallsQueued]               INT             NULL,
    [MaxCallWaitTime]              INT             NULL,
    [ServicelLevelTop]             NUMERIC (13, 1) NULL,
    [ServicelLevelBottom]          INT             NULL,
    [RunID]                        INT             NULL,
    [RunDate]                      DATETIME        NULL,
    [CheckSum]                     INT             NULL,
    CONSTRAINT [PKCiscoPrecisionQueueSummaryId] PRIMARY KEY NONCLUSTERED ([CiscoPrecisionQueueSummaryId] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_CiscoPrecisionQueueSummary]
    ON [Reporting].[CiscoPrecisionQueueSummary]([Date] ASC, [PrecisionQueueKey] ASC);

