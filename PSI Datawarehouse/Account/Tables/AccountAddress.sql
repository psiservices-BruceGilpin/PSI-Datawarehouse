CREATE TABLE [Account].[AccountAddress] (
    [AccountAddressId]   INT          IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]    INT          NOT NULL,
    [AccountKey]         INT          NOT NULL,
    [Address1]           VARCHAR (50) NULL,
    [Address2]           VARCHAR (50) NULL,
    [City]               VARCHAR (30) NULL,
    [State]              VARCHAR (30) NULL,
    [AddressType]        VARCHAR (30) NULL,
    [Checksum]           INT          NOT NULL,
    [CreatedDate]        DATETIME     DEFAULT (getdate()) NOT NULL,
    [CurrentFlag]        BIT          DEFAULT ((0)) NOT NULL,
    [RunID]              INT          NOT NULL,
    [AccountAddressDBId] INT          NULL,
    PRIMARY KEY CLUSTERED ([AccountAddressId] ASC),
    CONSTRAINT [FK_AccountAddress_Accounts] FOREIGN KEY ([AccountKey]) REFERENCES [Account].[Accounts] ([AccountId])
);


GO
CREATE NONCLUSTERED INDEX [IX_AccountAddress_AccountAddressDBID]
    ON [Account].[AccountAddress]([AccountAddressDBId] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_AccountAddress_AccountKey]
    ON [Account].[AccountAddress]([AccountKey] ASC);

