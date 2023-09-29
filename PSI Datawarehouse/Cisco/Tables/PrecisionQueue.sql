CREATE TABLE [Cisco].[PrecisionQueue] (
    [PrecisionQueueID]              INT          IDENTITY (1, 1) NOT NULL,
    [SourceSystemPrecisionQueueKey] INT          NULL,
    [SourceSystemKey]               INT          NULL,
    [EnterpriseName]                VARCHAR (52) NULL,
    [Description]                   VARCHAR (62) NULL,
    [IsDeleted]                     CHAR (1)     NULL,
    [RunID]                         INT          NULL,
    [EffectiveFrom]                 DATETIME     NULL,
    [CheckSum]                      INT          NULL,
    [EffectiveTo]                   DATETIME     CONSTRAINT [dfPrecisionQueueEffectiveTo] DEFAULT ('2999-12-31') NULL,
    [ServiceLevelType]              SMALLINT     NULL,
    [ServiceLevelThreshold]         INT          NULL,
    CONSTRAINT [PKPrecisionQueueID] PRIMARY KEY CLUSTERED ([PrecisionQueueID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_PrecisionQueue_SourceSystemPrecisionQueueKey]
    ON [Cisco].[PrecisionQueue]([SourceSystemPrecisionQueueKey] ASC);

