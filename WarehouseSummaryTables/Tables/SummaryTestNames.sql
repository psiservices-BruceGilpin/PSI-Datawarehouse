CREATE TABLE [Tests].[SummaryTestNames]
(
	[SummaryTestNamesDBID] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [CrossRefKey] int not null,
    [DimensionsTestKey] INT NOT NULL, 
    [SummaryTestName] VARCHAR(2000) NOT NULL, 
    [DimensionsAcctKey] int null,
    [AccountCode] Varchar(12),
    [Loaddate] DATETIME NOT NULL, 
    [CreateDate] DATETIME NOT NULL DEFAULT getdate()

)
