CREATE TABLE [Dimensions].[PublicationPoolsAreas]
(
	[PublicationPoolAreaId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [PublicationPoolAreaDBID] INT NULL, 
    [PubPoolAreaItemSetDBID] Int  Null,
    [CurrentFlag] BIT NOT NULL DEFAULT 0, 
    [CreatedDate] DATETIME NOT NULL DEFAULT getdate(), 
    [Checksum] BIGINT NOT NULL, 
    [SourceSystemKey] UNIQUEIDENTIFIER NOT NULL, 
    [PublicationPoolKey] Int Not Null,
    [AreaName] VARCHAR(100) NOT NULL, 
    [DateAdded] DATETIME NOT NULL, 
    [IsScored] BIT NOT NULL, 
    [CastCount] INT NOT NULL
)

GO

CREATE INDEX [IX_PublicationPoolsAreas_CurrentFlag] ON [Dimensions].[PublicationPoolsAreas] ([CurrentFlag])
Include (PubPoolAreaItemSetDBID)
