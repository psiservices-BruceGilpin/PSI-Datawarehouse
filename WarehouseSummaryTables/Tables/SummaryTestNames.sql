CREATE TABLE [Tests].[SummaryTestNames]
(
	[SummaryTestNamesDBID] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [CrossRefKey] int not null,
    [DimensionsTestKey] INT NOT NULL, 
    [SummaryTestName] VARCHAR(2000) NOT NULL, 
    [SourceTestname] VARCHAR(2000) NOT NULL, 
    [DimensionsAcctKey] int null,
    [Loaddate] DATETIME NOT NULL

)
