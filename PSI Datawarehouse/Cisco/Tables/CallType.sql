CREATE TABLE [Cisco].[CallType] (
    [CallTypeID]              INT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemCallTypeKey] INT           NULL,
    [SourceSystemKey]         INT           NULL,
    [EnterpriseName]          VARCHAR (52)  NULL,
    [Description]             VARCHAR (134) NULL,
    [ServiceLevelThreshold]   INT           NULL,
    [ServiceLevelType]        SMALLINT      NULL,
    [IsDeleted]               CHAR (1)      NULL,
    [RunID]                   INT           NULL,
    [EffectiveFrom]           DATETIME      NULL,
    [EffectiveTo]             DATETIME      CONSTRAINT [dfCallTypeEffectiveTo] DEFAULT ('2999-12-31') NULL,
    [CheckSum]                INT           NULL,
    CONSTRAINT [PKCallTypeID] PRIMARY KEY CLUSTERED ([CallTypeID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_CallType_SourceSystemCallTypeKey]
    ON [Cisco].[CallType]([SourceSystemCallTypeKey] ASC);

