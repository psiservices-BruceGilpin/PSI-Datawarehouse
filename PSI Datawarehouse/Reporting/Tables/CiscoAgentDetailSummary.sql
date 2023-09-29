CREATE TABLE [Reporting].[CiscoAgentDetailSummary] (
    [CiscoAgentDetailSummaryID] BIGINT   IDENTITY (1, 1) NOT NULL,
    [Date]                      DATE     NULL,
    [TimeZone]                  INT      NULL,
    [PrecisionQueueKey]         INT      NULL,
    [AgentsKey]                 INT      NULL,
    [CallsHandled]              INT      NULL,
    [HandledCallsTime]          INT      NULL,
    [ALLPQCallsHandled]         INT      NULL,
    [ALLPQHandleTime]           INT      NULL,
    [WrapTime]                  INT      NULL,
    [TalkTime]                  INT      NULL,
    [HoldTime]                  INT      NULL,
    [AvailTime]                 INT      NULL,
    [RunID]                     INT      NULL,
    [RunDate]                   DATETIME NULL,
    [CheckSum]                  INT      NULL,
    CONSTRAINT [PKCiscoAgentDetailSummaryID] PRIMARY KEY NONCLUSTERED ([CiscoAgentDetailSummaryID] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_CiscoAgentDetailSummary]
    ON [Reporting].[CiscoAgentDetailSummary]([Date] ASC, [PrecisionQueueKey] ASC, [AgentsKey] ASC);

