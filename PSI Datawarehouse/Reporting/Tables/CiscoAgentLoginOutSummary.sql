CREATE TABLE [Reporting].[CiscoAgentLoginOutSummary] (
    [CiscoAgentLoginOutSummaryId] BIGINT   IDENTITY (1, 1) NOT NULL,
    [Date]                        DATE     NULL,
    [AgentsKey]                   INT      NULL,
    [LoginDate]                   DATE     NULL,
    [LoginTime]                   TIME (7) NULL,
    [LogoutDate]                  DATE     NULL,
    [LogoutTime]                  TIME (7) NULL,
    [Duration]                    INT      NULL,
    [RunID]                       INT      NULL,
    [RunDate]                     DATETIME NULL,
    [CheckSum]                    INT      NULL,
    CONSTRAINT [PKCiscoAgentLoginOutSummaryId] PRIMARY KEY NONCLUSTERED ([CiscoAgentLoginOutSummaryId] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_CiscoAgentLoginOutSummary]
    ON [Reporting].[CiscoAgentLoginOutSummary]([Date] ASC, [AgentsKey] ASC);

