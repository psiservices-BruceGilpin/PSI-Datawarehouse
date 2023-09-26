CREATE TABLE [Cisco].[AgentInterval] (
    [AgentIntervalId]    BIGINT   IDENTITY (1, 1) NOT NULL,
    [Date]               DATE     NULL,
    [Time]               TIME (7) NULL,
    [AgentsKey]          INT      NULL,
    [SourceSystemKey]    INT      NULL,
    [TimeZone]           INT      NULL,
    [MRDomainKey]        BIGINT   NULL,
    [LoggedOnTime]       INT      NULL,
    [AvailTime]          INT      NULL,
    [NotReadyTime]       INT      NULL,
    [TalkOtherTime]      INT      NULL,
    [AvailableInMRDTime] INT      NULL,
    [RoutableInMRDTime]  INT      NULL,
    [ReportingHalfHour]  INT      NULL,
    [ReportingInterval]  INT      NULL,
    [Extension]          INT      NULL,
    [RunID]              INT      NULL,
    [EffectiveFrom]      DATETIME NULL,
    [CheckSum]           INT      NULL,
    [EffectiveTo]        DATETIME CONSTRAINT [dfAgentIntervalEffectiveTo] DEFAULT ('2999-12-31') NULL,
    CONSTRAINT [PKAgentIntervalId] PRIMARY KEY NONCLUSTERED ([AgentIntervalId] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_AgentInterval]
    ON [Cisco].[AgentInterval]([Date] ASC, [Time] ASC, [AgentsKey] ASC, [MRDomainKey] ASC);

