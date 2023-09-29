CREATE TABLE [Cisco].[WrapUpData] (
    [WrapUpDataID]    INT          IDENTITY (1, 1) NOT NULL,
    [WrapUpData]      VARCHAR (60) NULL,
    [SourceSystemKey] INT          NULL,
    [RunID]           INT          NULL,
    [EffectiveFrom]   DATETIME     NULL,
    [CheckSum]        INT          NULL,
    [EffectiveTo]     DATETIME     CONSTRAINT [dfWrapUpDataEffectiveTo] DEFAULT ('2999-12-31') NULL,
    CONSTRAINT [PKWrapUpDataID] PRIMARY KEY CLUSTERED ([WrapUpDataID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_WrapUpData_WrapUpData]
    ON [Cisco].[WrapUpData]([WrapUpData] ASC);

