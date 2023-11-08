CREATE TABLE [Dimensions].[QuestionStatus]
(
	[QuestionStatusId] INT NOT NULL PRIMARY KEY, 
    [QuestionStatusDBID] INT NOT NULL, 
    [Currentflag] BIT NOT NULL DEFAULT 0, 
    [LoadDate]    datetime DEFAULT getdate(),
    [StatusTitle] VARCHAR(16) NOT NULL, 
    [StatusDescription] VARCHAR(50) NULL, 
    [Checksum] BIGINT NOT NULL
)
