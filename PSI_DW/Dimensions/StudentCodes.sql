CREATE TABLE [Dimensions].[StudentCodes]
(
	[StudentCodeId] BIGINT NOT NULL Identity(1,1) PRIMARY KEY, 
    [StudentScoresKey] BIGINT NOT NULL, 
    [PoolCodeGroupKey] BIGINT NOT NULL, 
    [CreateDate] DATETIME NOT NULL DEFAULT getdate(), 
    [CheckSum] BIGINT NOT NULL
)

GO

CREATE INDEX [IX_StudentCodes_StudentScores] ON [Dimensions].[StudentCodes] ([StudentScoresKey])
include ([PoolCodeGroupKey])

GO

CREATE INDEX [IX_StudentCodes_Column] ON [Dimensions].[StudentCodes] ([PoolCodeGroupKey])
Include (StudentScoresKey)