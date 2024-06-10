CREATE TABLE [AtlasCloud].[ItemBanks]
(
	[ItemBankId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [ItemBankName] VARCHAR(255) NOT NULL, 
    [ItemBankDBID] INT NULL, 
    [Currentflag] BIT NOT NULL DEFAULT 0, 
    [Checksum] BIGINT NULL, 
    [CreateDate] DATETIME NOT NULL DEFAULT getdate()
)
