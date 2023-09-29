CREATE TABLE [Dimensions].[Banks] (
    [BankId]            BIGINT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]   SMALLINT         NOT NULL,
    [SourceBankKey]     UNIQUEIDENTIFIER NOT NULL,
    [BankDBID]          BIGINT           NOT NULL,
    [CurrentFlag]       BIT              DEFAULT ((0)) NOT NULL,
    [AreaKey]           BIGINT           NOT NULL,
    [BankTitle]         VARCHAR (50)     NOT NULL,
    [BankDescription]   VARCHAR (2000)   NULL,
    [BankSim]           BIT              NULL,
    [BankCopyright]     VARCHAR (255)    NULL,
    [EnforceOutline]    BIT              NULL,
    [BankSequenceLenth] SMALLINT         NULL,
    [isDeleted]         BIT              NULL,
    [Checksum]          BIGINT           NOT NULL,
    [LoadDate]          DATETIME         DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([BankId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Banks_Area]
    ON [Dimensions].[Banks]([AreaKey] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_Banks_BankDBID]
    ON [Dimensions].[Banks]([BankDBID] ASC)
    INCLUDE([BankTitle]) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_Banks_BankTitle]
    ON [Dimensions].[Banks]([BankTitle] ASC) WHERE ([Currentflag]=(0));

