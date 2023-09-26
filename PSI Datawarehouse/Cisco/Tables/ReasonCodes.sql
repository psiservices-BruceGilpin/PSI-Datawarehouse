CREATE TABLE [Cisco].[ReasonCodes] (
    [ReasonCodesId]   BIGINT       IDENTITY (1, 1) NOT NULL,
    [ReasonCode]      INT          NULL,
    [SourceSystemKey] INT          NULL,
    [Description]     VARCHAR (50) NULL,
    [NotReady]        BIT          NULL,
    [Approved]        BIT          NULL,
    [RunID]           INT          NULL,
    [EffectiveFrom]   DATETIME     NULL,
    [CheckSum]        INT          NULL,
    [EffectiveTo]     DATETIME     CONSTRAINT [dfReasonCodesEffectiveTo] DEFAULT ('2999-12-31') NULL,
    CONSTRAINT [PKReasonCodesId] PRIMARY KEY CLUSTERED ([ReasonCodesId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ReasonCodes_ReasonCode]
    ON [Cisco].[ReasonCodes]([ReasonCode] ASC);

