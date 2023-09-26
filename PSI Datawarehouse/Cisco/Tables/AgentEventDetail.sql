CREATE TABLE [Cisco].[AgentEventDetail] (
    [AgentEventDetailId] BIGINT   IDENTITY (1, 1) NOT NULL,
    [Date]               DATE     NULL,
    [Time]               TIME (7) NULL,
    [AgentsKey]          INT      NULL,
    [SourceSystemKey]    INT      NULL,
    [MRDomainKey]        BIGINT   NULL,
    [TimeZone]           INT      NULL,
    [LoginDate]          DATE     NULL,
    [LoginTime]          TIME (7) NULL,
    [Event]              INT      NULL,
    [Duration]           INT      NULL,
    [ReasonCodesKey]     BIGINT   NULL,
    [RunID]              INT      NULL,
    [EffectiveFrom]      DATETIME NULL,
    [CheckSum]           INT      NULL,
    [EffectiveTo]        DATETIME CONSTRAINT [dfAgentEventEffectiveTo] DEFAULT ('2999-12-31') NULL,
    CONSTRAINT [PKAgentEventDetailId] PRIMARY KEY NONCLUSTERED ([AgentEventDetailId] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_AgentEventDetail]
    ON [Cisco].[AgentEventDetail]([Date] ASC, [Time] ASC, [AgentsKey] ASC, [MRDomainKey] ASC);

