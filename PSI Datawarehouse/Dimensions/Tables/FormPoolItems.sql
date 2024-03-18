CREATE TABLE [Dimensions].[FormPoolItems]
(
	[FormPoolItemId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [FormPoolItemDBID] Int  Null,
    [SourceSystemKey]    UniqueIdentifier Not Null,
    [CurrentFlag] BIT NOT NULL DEFAULT 0, 
    [CreatedDate] DATETIME NOT NULL DEFAULT getdate(), 
    [FormPoolKey] int null,
    [QuestionKey] int null,
    [DeletedFlag] CHAR(10),
   [DeActiveationDate] DATETIME NULL, 
    [Difficulty] DECIMAL(8, 4) NOT NULL, 
    [PointBiserial] DECIMAL(8, 4) NOT NULL, 
    [AngoffRating] INT NULL, 
    [FriendlyName] VARCHAR(128) NULL, 
    [PTheta] DECIMAL(8, 7) NULL, 
    [InfTheta] DECIMAL(8, 7) NULL, 
    [Checksum] INT NULL

    )



GO

CREATE INDEX [IX_PublicationPoolItems_CurrentFlag] ON [Dimensions].[FormPoolItems] ([CurrentFlag])
Include ([FormPoolItemDBID])
