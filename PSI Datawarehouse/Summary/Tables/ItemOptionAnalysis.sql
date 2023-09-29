CREATE TABLE [Summary].[ItemOptionAnalysis] (
    [ItemOptionId]    BIGINT       IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey] SMALLINT     NOT NULL,
    [SourceSystemID]  VARCHAR (50) NOT NULL,
    [ItemBankKey]     BIGINT       NOT NULL,
    [ItemOptionKey]   BIGINT       NOT NULL,
    [ItemStatusKey]   SMALLINT     NOT NULL,
    [OptionOrder]     TINYINT      NOT NULL,
    [nT]              INT          NULL,
    [nY]              INT          NULL,
    [SigmaX]          INT          NULL,
    [SigmaSqX]        INT          NULL,
    [SigmaY]          INT          NULL,
    [SummaryYear]     INT          NOT NULL,
    [SummaryWeek]     INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([ItemOptionId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ItemOptionStats_ItembankKey]
    ON [Summary].[ItemOptionAnalysis]([ItemBankKey] ASC)
    INCLUDE([ItemOptionKey]);

