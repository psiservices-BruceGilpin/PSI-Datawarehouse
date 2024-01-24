
CREATE TABLE [Students].[BankGroupSummary]
(
	[BankGroupSummId] BIGINT NOT NULL Identity(1,1) PRIMARY KEY, 
    [StudentTestSummaryKey] BIGINT NOT NULL, 
    [BankGroupTitle] VARCHAR(50) NOT NULL, 
    [BankGroupDesc] VARCHAR(600) NULL, 
    [PreTest] BIT NOT NULL, 
    [TestCount] INT NOT NULL, 
    [LoadDateTime] DATETIME NULL DEFAULT getdate()
)

go




CREATE INDEX [IX_BankGroupSummary_TestSummaryKey] ON [Students].[BankGroupSummary] ([StudentTestSummaryKey])
