CREATE TABLE [Dimensions].[QuestionTypes]
(
	[QuestionTypeId] INT NOT NULL PRIMARY KEY, 
    [QuestionTypeDBID] INT NOT NULL, 
    [CurrentFlag] BIT NOT NULL DEFAULT 0, 
    [QuestionTypeTitle] VARCHAR(10) NOT NULL, 
    [QuestionTypeDesc] VARCHAR(60) NULL, 
    [Checksum] BIGINT NOT NULL, 
    [Createdate] DATETIME NOT NULL DEFAULT getdate()
)
