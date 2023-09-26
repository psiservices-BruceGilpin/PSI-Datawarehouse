CREATE TABLE [Reporting].[CiscoEntryPointSummary] (
    [CiscoEntryPointSummaryId] BIGINT   IDENTITY (1, 1) NOT NULL,
    [Date]                     DATE     NULL,
    [EntryPointKey]            INT      NULL,
    [OfferedChats]             INT      NULL,
    [AbandonedChats]           INT      NULL,
    [ServicedChats]            INT      NULL,
    [ServicedChattingTime]     INT      NULL,
    [ServicedWrapUPTime]       INT      NULL,
    [WrapUpChats]              INT      NULL,
    [ServicedChatDurationTime] INT      NULL,
    [ServicedWaitTime]         INT      NULL,
    [TotalAbandonedTime]       INT      NULL,
    [RunID]                    INT      NULL,
    [RunDate]                  DATETIME NULL,
    [CheckSum]                 INT      NULL,
    CONSTRAINT [PKCiscoEntryPointSummaryId] PRIMARY KEY NONCLUSTERED ([CiscoEntryPointSummaryId] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_CiscoEntryPointSummary]
    ON [Reporting].[CiscoEntryPointSummary]([Date] ASC, [EntryPointKey] ASC);

