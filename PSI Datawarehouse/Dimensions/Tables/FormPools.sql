CREATE TABLE [Dimensions].[FormPools]
(
	[FormPoolID] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [FormPoolDBID] INT NULL, 
    [CurrentFlag] BIT NOT NULL DEFAULT 0, 
    [CreatedDate] DATETIME NOT NULL DEFAULT getdate(), 
    [Checksum] BIGINT NOT NULL, 
    [SourceSystemKey] UNIQUEIDENTIFIER NOT NULL, 
    [FormPoolSpecKey] Int Not Null,
    [PoolName] VARCHAR(100) NOT NULL, 
    [DateAdded] DATETIME NOT NULL, 
    [IsScored] BIT NOT NULL, 
    [CastCount] INT NOT NULL 
)

GO

CREATE INDEX [IX_PublicationPoolsAreas_CurrentFlag] ON [Dimensions].[FormPools] ([CurrentFlag])
Include (FormPoolDBID)
