CREATE TABLE [Cisco].[MRDomain] (
    [MRDomainId]             BIGINT        IDENTITY (1, 1) NOT NULL,
    [SourceSytemMRDomainKey] INT           NULL,
    [SourceSystemKey]        INT           NULL,
    [MediaClassID]           INT           NULL,
    [EnterpriseName]         VARCHAR (32)  NULL,
    [Description]            VARCHAR (100) NULL,
    [Interruptible]          CHAR (1)      NULL,
    [TaskLife]               INT           NULL,
    [TaskStartTimeout]       INT           NULL,
    [ServiceLevelThreshold]  INT           NULL,
    [ServiceLevelType]       SMALLINT      NULL,
    [MaxTaskDuration]        INT           NULL,
    [MaxCallsInQueue]        INT           NULL,
    [MaxTimeInQueue]         INT           NULL,
    [RunID]                  INT           NULL,
    [EffectiveFrom]          DATETIME      NULL,
    [CheckSum]               INT           NULL,
    [EffectiveTo]            DATETIME      CONSTRAINT [dfMRDomainEffectiveTo] DEFAULT ('2999-12-31') NULL,
    CONSTRAINT [PKMRDomainId] PRIMARY KEY CLUSTERED ([MRDomainId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_MRDomain_SourceSytemMRDomainKey]
    ON [Cisco].[MRDomain]([SourceSytemMRDomainKey] ASC);

