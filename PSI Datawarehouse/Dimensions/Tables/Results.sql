CREATE TABLE [Dimensions].[ResultsStaging]
(
	[ResultId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [SourceSystemKey] TINYINT NOT NULL, 
    [SourceSystemID] UNIQUEIDENTIFIER NOT NULL, 
    [SourceSystemAreaID] UNIQUEIDENTIFIER NOT NULL, 
    [ResultDBID] INT NULL, 
    [CurrentFlag] BIT NOT NULL DEFAULT 0, 
    [CreateDate] DateTime not null default getdate(),
    [ResultTitle] VARCHAR(50) NOT NULL, 
    [ResultDesc] VARCHAR(100) NULL, 
    [ResultMode] TINYINT NULL, 
    [FullMasteryScore] INT NULL, 
    [PartialMasteryScore] INT NULL, 
    [FullMasteryCode] VARCHAR(20) NULL, 
    [PartialMasteryCode] VARCHAR(20) NULL, 
    [RawCut] INT NULL, 
    [RawMin] INT NULL, 
    [ScaleMax] INT NULL, 
    [ScaleCut] INT NULL, 
    [PassCode] VARCHAR(10) NULL, 
    [FaliCode] VARCHAR(10) NULL, 
    [ScoreMode] TINYINT NULL
)
