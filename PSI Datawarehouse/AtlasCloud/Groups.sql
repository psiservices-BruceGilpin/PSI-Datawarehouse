CREATE TABLE [AtlasCloud].[Groups]
(
	[GroupsId] INT NOT NULL Identity(1,1)  PRIMARY KEY, 
    [SytemName] VARCHAR(50) NOT NULL, 
    [Path] VARCHAR(250) NOT NULL, 
    [GroupDescription] VARCHAR(254) NULL, 
    [IsRemoved] BIT NOT NULL, 
    [DateRemoved] DATETIME NULL, 
    [Restored] DATETIME NULL, 
    [SourceSystemKey] SMALLINT NOT NULL, 
    [GroupsDBID] INT NULL, 
    [Currentflag] BIT NOT NULL DEFAULT 0, 
    [CheckSum] BIGINT NOT NULL, 
    [ActorID]   Bigint Not Null,
    [CreatedDate] DATETIME NOT NULL DEFAULT getdate()
)
