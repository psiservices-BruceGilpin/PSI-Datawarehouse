﻿CREATE TABLE [dbo].[KeyCrossReference]
(
	[CrossReferenceId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [Studentkey] INT NOT NULL, 
    [StudentScoreKey] INT NOT NULL, 
    [Testdate] DATE NOT NULL, 
    [TestPackageKey] INT NOT NULL, 
    [PackageTitle] Varchar(100) Not Null,
    [SummaryTestName] VARCHAR(2000) NOT NULL, 
    [DimensionsTestKey] INT NOT NULL, 
    [LoadDate] DATETIME NOT NULL DEFAULT getdate() 
)
