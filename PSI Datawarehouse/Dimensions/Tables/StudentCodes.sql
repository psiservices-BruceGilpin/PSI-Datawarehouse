CREATE TABLE [Dimensions].[StudentCodes] (
    [StudentCodeId]    BIGINT   IDENTITY (1, 1) NOT NULL,
    [StudentScoresKey] BIGINT   NOT NULL,
    [PoolCodeGroupKey] BIGINT   NOT NULL,
    [CreateDate]       DATETIME DEFAULT (getdate()) NOT NULL,
    [CheckSum]         BIGINT   NOT NULL,
    [PoolCode]         BIGINT   NULL,
    PRIMARY KEY CLUSTERED ([StudentCodeId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_StudentCodes_StudentScores]
    ON [Dimensions].[StudentCodes]([StudentScoresKey] ASC)
    INCLUDE([PoolCodeGroupKey]);


GO
CREATE NONCLUSTERED INDEX [IX_StudentCodes_Column]
    ON [Dimensions].[StudentCodes]([PoolCodeGroupKey] ASC)
    INCLUDE([StudentScoresKey]);

