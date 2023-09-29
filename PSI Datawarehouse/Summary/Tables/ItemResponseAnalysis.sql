CREATE TABLE [Summary].[ItemResponseAnalysis] (
    [ItemResponseAnalysisId] BIGINT        IDENTITY (1, 1) NOT NULL,
    [PortionName]            VARCHAR (100) NOT NULL,
    [ItemKey]                BIGINT        NOT NULL,
    [AsofDate]               DATE          NOT NULL,
    [ItemStatus]             INT           NOT NULL,
    [nT]                     INT           NULL,
    [nY]                     INT           NULL,
    [SigmaX]                 INT           NULL,
    [SigmaSQX]               BIGINT        NULL,
    [SigmaY]                 INT           NULL,
    PRIMARY KEY CLUSTERED ([AsofDate] ASC, [ItemResponseAnalysisId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ItemResponseAnalysis_FixedFormItem]
    ON [Summary].[ItemResponseAnalysis]([ItemKey] ASC)
    INCLUDE([AsofDate]);

