CREATE TABLE [Cisco].[RoutingQueue] (
    [RoutingQueueID]        BIGINT       IDENTITY (1, 1) NOT NULL,
    [SourceSystemQueueKey]  INT          NULL,
    [SourceSystemKey]       INT          NULL,
    [QueueName]             VARCHAR (75) NULL,
    [QueueType]             SMALLINT     NULL,
    [TransferQueue]         SMALLINT     NULL,
    [IsDeleted]             CHAR (1)     NULL,
    [ChatAttachmentEnabled] SMALLINT     NULL,
    [RunID]                 INT          NULL,
    [EffectiveFrom]         DATETIME     NULL,
    [CheckSum]              INT          NULL,
    [EffectiveTo]           DATETIME     CONSTRAINT [dfEffectiveToRoutingQueue] DEFAULT ('2099/12/31') NULL,
    CONSTRAINT [PKRoutingQueueID] PRIMARY KEY CLUSTERED ([RoutingQueueID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_RoutingQueue_SourceSystemQueueKey]
    ON [Cisco].[RoutingQueue]([SourceSystemQueueKey] ASC);

