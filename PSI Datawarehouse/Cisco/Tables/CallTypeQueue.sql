CREATE TABLE [Cisco].[CallTypeQueue] (
    [CallTypeQueueID] INT          IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey] INT          NULL,
    [CallQueue]       VARCHAR (72) NULL,
    [RunID]           INT          NULL,
    [EffectiveFrom]   DATETIME     NULL,
    [CheckSum]        INT          NULL,
    [EffectiveTo]     DATETIME     CONSTRAINT [dfCallTypeQueueEffectiveTo] DEFAULT ('2999-12-31') NULL,
    CONSTRAINT [PKCallTypeQueueID] PRIMARY KEY CLUSTERED ([CallTypeQueueID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_CallTypeQueue_CallQueue]
    ON [Cisco].[CallTypeQueue]([CallQueue] ASC);

