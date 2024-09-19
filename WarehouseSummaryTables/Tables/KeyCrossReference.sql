CREATE TABLE [dbo].[KeyCrossReference]
(
	[CrossReferenceId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [Studentkey] INT NOT NULL, 
    [StudentScoreKey] INT NOT NULL, 
    [Testdate] DATE NOT NULL, 
    [SummaryTestName] VARCHAR(450) NOT NULL, 
    [DimensionsTestKey] INT NOT NULL, 
    [LoadDate] DATETIME NOT NULL DEFAULT getdate(), 
    [PackageKey] INT NULL, 
    [StudentGroupKey] INT NULL 
)

GO

CREATE INDEX [IX_KeyCrossReference_DimensionsTesttKey] ON [dbo].[KeyCrossReference] ([DimensionsTestKey])
Include ([StudentKey])

GO

CREATE INDEX [IX_KeyCrossReference_TestDate] ON [dbo].[KeyCrossReference] ([Testdate])
INCLUDE ([Studentkey],[StudentScoreKey],[DimensionsTestKey],[PackageKey])

GO

CREATE INDEX [IX_KeyCrossReference_SummaryTestName] ON [dbo].[KeyCrossReference] ([SummaryTestName])
Include (StudentScoreKey)
