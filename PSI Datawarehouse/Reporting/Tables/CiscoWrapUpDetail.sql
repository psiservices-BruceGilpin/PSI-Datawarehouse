CREATE TABLE [Reporting].[CiscoWrapUpDetail] (
    [CiscoWrapUpDetailID] BIGINT       IDENTITY (1, 1) NOT NULL,
    [Date]                DATE         NULL,
    [AgentsKey]           INT          NULL,
    [CallTypeKey]         INT          NULL,
    [PrecisionQueueKey]   INT          NULL,
    [WrapUpDataKey]       INT          NULL,
    [TimeZone]            INT          NULL,
    [Extension]           VARCHAR (32) NULL,
    [DayID-CallID-SeqNo]  VARCHAR (18) NULL,
    [CallStartDate]       DATE         NULL,
    [CallStartTime]       TIME (7)     NULL,
    [CallEndDate]         DATE         NULL,
    [CallEndTime]         TIME (7)     NULL,
    [CallANI]             VARCHAR (52) NULL,
    [CalledNumber]        VARCHAR (40) NULL,
    [TalkTime]            INT          NULL,
    [HoldTime]            INT          NULL,
    [WorkTime]            INT          NULL,
    [RouterCallKey]       INT          NULL,
    [RouterCallKeyDay]    INT          NULL,
    [RunID]               INT          NULL,
    [RunDate]             DATETIME     NULL,
    [CheckSum]            INT          NULL,
    CONSTRAINT [PKCiscoWrapUpDetailID] PRIMARY KEY NONCLUSTERED ([CiscoWrapUpDetailID] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_CiscoWrapUpDetail]
    ON [Reporting].[CiscoWrapUpDetail]([Date] ASC, [AgentsKey] ASC, [CallTypeKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CiscoWrapUpDetail_Keys]
    ON [Reporting].[CiscoWrapUpDetail]([PrecisionQueueKey] ASC, [WrapUpDataKey] ASC);

