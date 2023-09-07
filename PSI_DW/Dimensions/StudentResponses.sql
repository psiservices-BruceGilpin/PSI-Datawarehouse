CREATE TABLE [Dimensions].[StudentResponses]
(
	[StudentResponseId] BIGINT NOT NULL Identity(1,1) PRIMARY KEY, 
    [StudentItemKey] BIGINT NOT NULL,
    [NumericChoice] SMALLINT NULL, 
    [StringChoice] VARCHAR(5) NULL, 
    [ResponseIndex] int null,
    [Points] DECIMAL(6, 2) NULL, 
    [StudentResponseDBID] BIGINT NULL, 
    [CurrentFlag] BIT NOT NULL DEFAULT 0, 
    [Checksum] BIGINT NULL, 
    [LoadDate] DATETIME NOT NULL DEFAULT getdate()
)

GO

CREATE INDEX [IX_StudentResponses_CurrentFlag] ON [Dimensions].[StudentResponses] ([CurrentFlag])
Include (StudentResponseDBID)