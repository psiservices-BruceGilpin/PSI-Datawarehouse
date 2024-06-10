CREATE TABLE [AtlasCloud].[Tests]
(
	[TestsId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [SourceSystemKey] SMALLINT NOT NULL, 
    [Status] SMALLINT NOT NULL, 
    [Language] VARCHAR(20) NULL, 
    [TestTitle] VARCHAR(255) NOT NULL, 
    [TypeKey] SMALLINT NULL, 
    [Cutoffscore] INT NULL, 
    [TestCreatedDate] DATETIME NOT NULL, 
    [GlobalCategory] VARCHAR(100) NULL, 
    [CutoffPercent] DECIMAL(8, 2) NULL, 
    [TestsDBID] INT NULL, 
    [Currentflag] BIT NOT NULL DEFAULT 0, 
    [CreatedDate] DATETIME NOT NULL DEFAULT getdate(), 
    [Checksum] BIGINT NULL
)
