CREATE TABLE [AtlasCloud].[Account]
(
	[AccountId] INT NOT NULL PRIMARY KEY,
	[SourceSystemKey] SMALLINT NOT NULL, 
    [AccountName] varchar(50) Not Null,
    [AccountDBID] INT NULL, 
    [Currentflag] BIT NOT NULL DEFAULT 0, 
    [CheckSum] BIGINT NOT NULL, 
    [SourceAccountID]   Bigint Not Null,
    [Path]      varchar(250) not null, 
    [LoadDate] DATETIME NOT NULL DEFAULT getdate(),
    [CreatedDate] Datetime Not Null,
    [ModifiedDate] Datetime Null,
    [RemovedDate] Datetime Null
)
