CREATE TABLE [Dimensions].[TestGradeLevels]
(
	[TestGradeLevelsId] INT NOT NULL identity(1,1) PRIMARY KEY, 
    [TestGradeLevelDBID] INT NULL, 
    [CurrentFlag] BIT NOT NULL DEFAULT 0, 
    [CreateDate] DATETIME NOT NULL DEFAULT getdate(), 
    [ResultsGradesID] UNIQUEIDENTIFIER NOT NULL, 
    [ResultKey] INT NOT NULL, 
    [GradeLowRange] INT NOT NULL, 
    [GradeLetter] VARCHAR(10) NOT NULL, 
    [CheckSum] BIGINT NULL
)
