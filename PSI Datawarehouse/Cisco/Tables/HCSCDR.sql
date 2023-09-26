CREATE TABLE [Cisco].[HCSCDR] (
    [HCSCDRID]                  BIGINT       IDENTITY (1, 1) NOT NULL,
    [Date]                      DATE         NULL,
    [SourceSystemKey]           INT          NULL,
    [CdrID]                     INT          NULL,
    [OrginationDate]            DATE         NULL,
    [OrginationTime]            TIME (7)     NULL,
    [ConnectDate]               DATE         NULL,
    [ConnectTime]               TIME (7)     NULL,
    [DisconnectDate]            DATE         NULL,
    [DisconnectTime]            TIME (7)     NULL,
    [GlobalCallIDCallId]        INT          NULL,
    [OrigLegCallIdentifier]     INT          NULL,
    [DestLegIdentifier]         INT          NULL,
    [CallingPartyNumber]        VARCHAR (50) NULL,
    [OriginalCalledPartyNumber] VARCHAR (50) NULL,
    [FinalCalledPartyNumber]    VARCHAR (50) NULL,
    [LastRedirectDn]            VARCHAR (50) NULL,
    [Duration]                  INT          NULL,
    [OrigCauseValue]            INT          NULL,
    [DestCauseValue]            INT          NULL,
    [RunID]                     INT          NULL,
    [EffectiveFrom]             DATETIME     NULL,
    [CheckSum]                  INT          NULL,
    [EffectiveTo]               DATETIME     CONSTRAINT [dfEffectiveToHCSCDR] DEFAULT ('2099/12/31') NULL,
    CONSTRAINT [PKHCSCDRID] PRIMARY KEY NONCLUSTERED ([HCSCDRID] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_HCSCDR]
    ON [Cisco].[HCSCDR]([Date] ASC, [CdrID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_HCSCDR_GlobalCallIDCallId]
    ON [Cisco].[HCSCDR]([GlobalCallIDCallId] ASC);

