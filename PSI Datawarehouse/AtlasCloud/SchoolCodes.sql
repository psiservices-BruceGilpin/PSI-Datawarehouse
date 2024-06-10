CREATE TABLE [AtlasCloud].[SchoolCodes]
(
	[SchoolCodeId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [ResultKey] INT NOT NULL, 
    [SchoolCode] VARCHAR(250) NULL, 
    [SchoolCodeDBID] INT NULL, 
    [LoadDate] DATETIME NOT NULL DEFAULT getdate(), 
    [CurrentFlag] BIT NOT NULL DEFAULT 0
)
