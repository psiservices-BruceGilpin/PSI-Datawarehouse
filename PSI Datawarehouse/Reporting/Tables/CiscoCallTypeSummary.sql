CREATE TABLE [Reporting].[CiscoCallTypeSummary] (
    [CiscoCallTypeSummaryID] BIGINT          IDENTITY (1, 1) NOT NULL,
    [Date]                   DATE            NULL,
    [CallTypeKey]            INT             NULL,
    [TimeZone]               INT             NULL,
    [AnswerWaitTime]         INT             NULL,
    [CallAnswered]           INT             NULL,
    [CallDelayAbandTime]     NUMERIC (13, 1) NULL,
    [CallsHandled]           INT             NULL,
    [CallsOffered]           INT             NULL,
    [HandleTime]             INT             NULL,
    [MaxCallWaitTime]        INT             NULL,
    [MinQueueTime]           INT             NULL,
    [OverflowOut]            INT             NULL,
    [ServicelLevelDeNom]     INT             NULL,
    [ServicelLevelNum]       NUMERIC (13, 1) NULL,
    [TotalCallsAband]        NUMERIC (13, 1) NULL,
    [TotalCallsAbandDenom]   INT             NULL,
    [IncompleteCalls]        INT             NULL,
    [ServiceLevelError]      INT             NULL,
    [RONA]                   INT             NULL,
    [SLThreshold]            INT             NULL,
    [RunID]                  INT             NULL,
    [RunDate]                DATETIME        NULL,
    [CheckSum]               INT             NULL,
    CONSTRAINT [PKCiscoCallTypeSummaryID] PRIMARY KEY NONCLUSTERED ([CiscoCallTypeSummaryID] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_CiscoCallTypeSummary]
    ON [Reporting].[CiscoCallTypeSummary]([Date] ASC, [CallTypeKey] ASC);

