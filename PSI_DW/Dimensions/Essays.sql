CREATE TABLE [Dimensions].[Essays]
(
	[EssayId] BIGINT NOT NULL Identity(1,1) PRIMARY KEY, 
    [StudentResponseKey] BIGINT NOT NULL, 
    [Essay] VARCHAR(MAX) NOT NULL, 
    [CurrentFlag] BIT NOT NULL DEFAULT 0, 
    [LoadDate] DATETIME NOT NULL DEFAULT getdate(), 
    [Checksum] BIGINT NOT NULL
)

GO

CREATE INDEX [IX_Essays_CurrentFlag] ON [Dimensions].[Essays] ([CurrentFlag])
Include (StudentResponseKey)
