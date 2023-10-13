CREATE TABLE [Dimensions].[SampleGroupItems]
(
	[SampleGroupItemId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [SampleGroupItemDBID] INT NULL, 
    [CurrentFlag] BIT NOT NULL DEFAULT 0, 
    [CreatedDate] DATETIME NOT NULL DEFAULT getdate(), 
    [ActiveFlag] BIT NOT NULL DEFAULT 0, 
    [DeActiveationDate] DATETIME NULL, 
    [Difficulty] DECIMAL(8, 7) NOT NULL, 
    [PointBiserial] DECIMAL(8, 7) NOT NULL, 
    [AngoffRating] DECIMAL(8, 7) NULL, 
    [EnemyDBID] INT NULL, 
    [AllyBDID] INT NULL, 
    [AllySequence] INT NULL, 
    [FriendlyName] VARCHAR(128) NULL, 
    [PTheta] DECIMAL(8, 7) NULL, 
    [InfTheta] DECIMAL(8, 7) NULL
)
