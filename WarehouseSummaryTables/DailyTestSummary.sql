CREATE TABLE [Tests].[DailyTestSummary]
(
	[DailyTestSummaryId] BIGINT NOT NULL Identity(1,1) PRIMARY KEY, 
    [ClientCode] VARCHAR(16) NOT NULL, 
    [TestTitle] VARCHAR(2000) NOT NULL, 
    [TestDate] DATE NOT NULL, 
    [AllCandidateN] INT NULL, 
    [AllCandidatePass] INT NULL, 
    [AllCandidateOther] INT NULL, 
    [AllCandidatePassRate] DECIMAL(5, 2) NULL, 
    [FirstTimeN] INT NULL, 
    [FirstTimePass] INT NULL, 
    [FirstTimePassRate] DECIMAL(5, 2) NULL
)

GO

CREATE INDEX [IX_DailyTestSummary_ClientDate] ON [Tests].[DailyTestSummary] ([ClientCode], [TestDate])
Include (TestTitle)
