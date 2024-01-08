CREATE TABLE [Summary].[StudentTestSummary]
(
	[StudentTestSumaryDBId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [DWStudentKey] BIGINT NOT NULL, 
    [DWTestScoreKey] BIGINT NOT NULL, 
    [DWTestKey] BIGINT NOT NULL, 
    [DWPackageKey] BIGINT NOT NULL, 
    [TestTitle] VARCHAR(50) NOT NULL, 
    [GlobalTestCenterID] VARCHAR(20) NULL, 
    [TestDate] DATE NOT NULL, 
    [ElapsedTime] INT NULL, 
    [FinalPoints] INT NULL, 
    [ExtraPoints] INT NULL, 
    [ScaledScore] INT NULL, 
    [ScorePoints] INT NULL, 
    [Attempt#] INT NULL, 
    [ComputedAttempt#] INT NULL, 
    [ADATime] INT NULL, 
    [ExtraTime] INT NULL, 
    [ExtraTimeUsed] INT NULL, 
    [ExtraStart] DATETIME NULL, 
    [ExtraEnd] DATETIME NULL, 
    [Proctored] BIT NULL, 
    [Retake] INT NULL, 
    [Restarts] INT NULL, 
    [TestVersion] INT NULL, 
    [LoadDateTime] DATETIME NULL 
)

GO

CREATE INDEX [IX_StudentTestSummary_DWStudentKey] ON [Summary].[StudentTestSummary] ([DWStudentKey])

GO

CREATE INDEX [IX_StudentTestSummary_DWTestKey] ON [Summary].[StudentTestSummary] ([DWTestKey])
