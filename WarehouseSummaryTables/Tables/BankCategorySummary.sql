CREATE TABLE [Students].[BankCategorySummary]
(
	[BankCatId] BIGINT NOT NULL Identity(1,1) PRIMARY KEY, 
    [BankCategorykey] BIGINT NOT NULL, 
    [BankGroupKey] BIGINT NOT NULL, 
    [StudentTestSummaryKey] BIGINT NOT NULL, 
    [BankCategoryTitle] VARCHAR(50) NOT NULL, 
    [BankCategoryDescription] VARCHAR(1000) NULL, 
    [BankCategoryStatus] TINYINT NULL, 
    [CategoryCount]     int Null,
    [LoadDateTime] DATETIME NOT NULL
)

GO

CREATE INDEX [IX_BankCategorySummary_TestSummaryKey] ON [Students].[BankCategorySummary] ([StudentTestSummaryKey])
