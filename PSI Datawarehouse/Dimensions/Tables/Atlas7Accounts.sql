CREATE TABLE [dimensions].[Atlas7Accounts]
(
	[Atlas7AccountId] INT NOT NULL identity(1,1) PRIMARY KEY, 
    [Atlas7ClientID] INT NOT NULL, 
    [Atlas7ClientCode] VARCHAR(50) NOT NULL, 
    [PoolKey] INT NOT NULL, 
    [AtlasAccountCode] VARCHAR(32) NULL, 
    [AtlasAccountID] INT NULL, 
    [AreaKey] INT NULL, 
    [Checksum] BIGINT NULL, 
    [Loaddate] DATETIME NOT NULL DEFAULT getdate(), 
    [CurrentFlag] TINYINT NOT NULL DEFAULT 0, 
    [Atlas7AccountDBID] INT NULL
)
