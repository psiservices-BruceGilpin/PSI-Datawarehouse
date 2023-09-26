CREATE TABLE [Cisco].[EntryPoint] (
    [EntryPointID]              INT          IDENTITY (1, 1) NOT NULL,
    [SourceSystemEntryPointKey] INT          NULL,
    [SourceSystemKey]           INT          NULL,
    [EntryPointName]            VARCHAR (45) NULL,
    [OriginalQueueKey]          INT          NULL,
    [OriginalQueueName]         VARCHAR (47) NULL,
    [RunID]                     INT          NULL,
    [EffectiveFrom]             DATETIME     NULL,
    [CheckSum]                  INT          NULL,
    [EffectiveTo]               DATETIME     CONSTRAINT [dfEntryPointEffectiveTo] DEFAULT ('2999-12-31') NULL,
    CONSTRAINT [PKEntryPointID] PRIMARY KEY CLUSTERED ([EntryPointID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_EntryPoint_SourceSystemEntryPointKey]
    ON [Cisco].[EntryPoint]([SourceSystemEntryPointKey] ASC);

