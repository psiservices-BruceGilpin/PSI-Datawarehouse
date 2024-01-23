CREATE TABLE [Students].[TestBankCategorySummary]
(
	[BankCatSummId] BIGINT NOT NULL Identity(1,1) PRIMARY KEY, 
    [StudentTestSummaryKey] BIGINT NOT NULL, 
    [BankCatGroupTitle] VARCHAR(50) NOT NULL, 
    [BankCatGroupDesc] VARCHAR(600) NULL, 
    [PreTest] BIT NOT NULL, 
    [TestCount] INT NOT NULL, 
    [LoadDateTime] DATETIME NULL DEFAULT getdate()
)

GO


CREATE INDEX [IX_TestBankCategorySummary_TestSummaryKey] ON [Students].[TestBankCategorySummary] ([StudentTestSummaryKey])
