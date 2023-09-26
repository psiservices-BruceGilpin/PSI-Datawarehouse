CREATE TABLE [Logging].[SummaryTableLoadHistory] (
    [LoadHistoryId] INT           IDENTITY (1, 1) NOT NULL,
    [TableName]     VARCHAR (100) NOT NULL,
    [MinLoadDate]   DATETIME      DEFAULT ('01/01/1900') NOT NULL,
    [LoadRefDate]   DATE          NULL,
    [MaxLoadDate]   DATETIME      NOT NULL,
    [CreateDate]    DATETIME      DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([LoadHistoryId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SummaryTableLoadHistory_TableName]
    ON [Logging].[SummaryTableLoadHistory]([TableName] ASC);

