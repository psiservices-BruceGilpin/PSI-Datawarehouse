CREATE TABLE [Dimensions].[TestGrading]
(
	[TestGradingId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [TestGradingdbid] INT NULL, 
    [SourceResultsID] uniqueidentifier not null,
    [CurrentFlag] BIT NOT NULL DEFAULT 0, 
    [CreateDate] DATETIME NOT NULL DEFAULT getdate(), 
    [CheckSum] BIGINT NULL, 
    [AreaKey] INT NOT NULL, 
    [TestGradeTitle] VARCHAR(100) NOT NULL, 
    [TestGradeDescription] VARCHAR(300) NULL, 
    [TestGradeMode] TINYINT NULL, 
    [FullMasteryScore] INT NULL, 
    [PartialMasteryScore] INT NULL, 
    [FullMasterySymbol] VARCHAR(30) NULL, 
    [PartialMasterySymbol] VARCHAR(30) NULL, 
    [NonMasterySymbol] Varchar(30) null,
    [GradeMode] TINYINT NULL, 
    [RawCut] INT NULL, 
    [ScaleCut] INT NULL, 
    [GradePass] VARCHAR(100) NULL, 
    [GradeFail] VARCHAR(100) NULL, 
    [ScoreMode] TINYINT NULL, 
    [Provisional] BIT NULL, 

)

GO

CREATE INDEX [IX_TestGrading_CurrentFlag] ON [Dimensions].[TestGrading] ([CurrentFlag])
Include ([AreaKey])
