CREATE TABLE [AtlasCloud].[VirtualServers]
(
	[VirtualServerId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [ServerName] VARCHAR(20) NOT NULL, 
    [Path] VARCHAR(250) NULL, 
    [ParentKey] INT NOT NULL, 
    [OrganizationName] VARCHAR(100) NULL, 
    [CurrentFlag] BIT NOT NULL DEFAULT 0, 
    [VirtualServerDBID] INT NULL, 
    [ActorID]   bigint not null,
    [Checksum] BIGINT NOT NULL, 
    [CreateDate] NCHAR(10) NULL
)
