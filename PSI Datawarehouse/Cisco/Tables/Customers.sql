CREATE TABLE [Cisco].[Customers] (
    [CustomersID]     BIGINT       IDENTITY (1, 1) NOT NULL,
    [EmailAddress]    VARCHAR (75) NULL,
    [CustomerName]    VARCHAR (75) NULL,
    [SourceSystemKey] INT          NULL,
    [RunID]           INT          NULL,
    [EffectiveFrom]   DATETIME     NULL,
    [CheckSum]        INT          NULL,
    [EffectiveTo]     DATETIME     CONSTRAINT [dfCustomersEffectiveTo] DEFAULT ('2999-12-31') NULL,
    CONSTRAINT [PKCustomersID] PRIMARY KEY CLUSTERED ([CustomersID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Customers_EmailCustomerName]
    ON [Cisco].[Customers]([EmailAddress] ASC, [CustomerName] ASC);

