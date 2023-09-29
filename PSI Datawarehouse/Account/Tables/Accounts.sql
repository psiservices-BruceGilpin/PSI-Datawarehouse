CREATE TABLE [Account].[Accounts] (
    [AccountId]             INT           IDENTITY (1, 1) NOT NULL,
    [SourceAccountID]       VARCHAR (20)  NOT NULL,
    [SourceSystemKey]       INT           NOT NULL,
    [BridgeOrganizationKey] INT           NULL,
    [AccountName]           VARCHAR (100) NOT NULL,
    [AccountType]           VARCHAR (20)  DEFAULT ('UNK') NOT NULL,
    [Status]                VARCHAR (20)  DEFAULT ('UNK') NOT NULL,
    [TerminationDate]       DATETIME      NULL,
    [PreviousStatus]        VARCHAR (20)  NULL,
    [IsDeleted]             BIT           NULL,
    [AliasName]             VARCHAR (250) NULL,
    [ClientCode]            VARCHAR (50)  NULL,
    [GlobalAccountID]       VARCHAR (20)  DEFAULT ('UNK') NOT NULL,
    [AccountPrefix]         VARCHAR (3)   NULL,
    [CheckSum]              BIGINT        NOT NULL,
    [RunID]                 INT           NOT NULL,
    [AccountDBID]           INT           NULL,
    [CreatedDate]           DATETIME      DEFAULT (getdate()) NOT NULL,
    [CurrentFlag]           BIT           DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([AccountId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Accounts_SourceAccountID]
    ON [Account].[Accounts]([SourceAccountID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Accounts_AccountDBID]
    ON [Account].[Accounts]([AccountDBID] ASC) WHERE ([CurrentFlag]=(0));

