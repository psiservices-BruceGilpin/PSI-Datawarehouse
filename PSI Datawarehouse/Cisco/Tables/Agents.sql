CREATE TABLE [Cisco].[Agents] (
    [AgentsID]          INT           IDENTITY (1, 1) NOT NULL,
    [SourceAgentKey]    INT           NULL,
    [SourceSystemKey]   INT           NULL,
    [FirstName]         VARCHAR (65)  NULL,
    [LastName]          VARCHAR (65)  NULL,
    [FullName]          VARCHAR (130) NULL,
    [LoginName]         VARCHAR (131) NULL,
    [IsDeleted]         CHAR (1)      NULL,
    [IsTempAgent]       CHAR (1)      NULL,
    [IsSupervisorAgent] CHAR (1)      NULL,
    [PeripheralID]      SMALLINT      NULL,
    [PeripheralNumber]  VARCHAR (32)  NULL,
    [RunID]             INT           NULL,
    [EffectiveFrom]     DATETIME      NULL,
    [EffectiveTo]       DATETIME      CONSTRAINT [dfAgentsEffectiveTo] DEFAULT ('2999-12-31') NULL,
    [CheckSum]          INT           NULL,
    [AgentTeam]         VARCHAR (32)  NULL,
    CONSTRAINT [PKAgentsID] PRIMARY KEY CLUSTERED ([AgentsID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Agents_SourceAgentKey]
    ON [Cisco].[Agents]([SourceAgentKey] ASC);

