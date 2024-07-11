CREATE TABLE [Students].[StudentTestSummary]
(
	[StudentTestSumaryDBId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [ClientCode] Varchar(12) Null,
    [DWTestScoreKey] BIGINT NOT NULL, 
    [DWTestKey] BIGINT NOT NULL, 
    [DWPackageKey] BIGINT NOT NULL, 
    [DWStudentKey] BigInt Not null,
    [PoolKey] bigint,
    [StudentAltID] Varchar(128),
    [FirstName] Varchar(30),
    [LastName] varchar(30),
    [MaidenName] varchar(25),
    [TestTitle] VARCHAR(50) NOT NULL, 
    [FormName] Varchar(100),
    [DateSched] Date,
    [GlobalTestCenterKey] VARCHAR(20) NULL, 
    [TestDate] DATE NOT NULL, 
    [ElapsedTime] INT NULL, 
    [PassFail] Char(1) null,
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
    [Restarts] INT NULL, 
    [TestVersion] INT NULL, 
    [LoadDateTime] DATETIME NULL, 
    [Recertification] CHAR NULL, 
    [Reapplicant] CHAR NULL, 
    [Checksum] BIGINT NOT NULL, 
    [CorrectPercentage] DECIMAL(6, 2) NULL 
)

GO

CREATE INDEX [IX_StudentTestSummary_DWStudentKey] ON [Students].[StudentTestSummary] ([DWStudentKey])

GO

CREATE INDEX [IX_StudentTestSummary_DWTestKey] ON [Students].[StudentTestSummary] ([DWTestKey])

GO

CREATE INDEX [IX_StudentTestSummary_StudentTest] ON [Students].[StudentTestSummary] ([DWStudentkey], [DWTestKey])
include (TestDate)

GO

CREATE INDEX [IX_StudentTestSummary_TestDate] ON [Students].[StudentTestSummary] ([TestDate])
Include ([DWTestScoreKey],[DWTestKey],[PassFail],[FinalPoints],[ComputedAttempt#])

GO

CREATE INDEX [IX_StudentTestSummary_TestTitle] ON [Students].[StudentTestSummary] ([TestTitle])
Include ([DWTestKey],[DWStudentKey])
