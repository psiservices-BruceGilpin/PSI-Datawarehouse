CREATE TABLE [Summary].[PortionMeasures] (
    [PassRateId]           BIGINT          IDENTITY (1, 1) NOT NULL,
    [TestPortionKey]       BIGINT          NOT NULL,
    [PortionName]          VARCHAR (100)   NOT NULL,
    [AllCandidatePassRate] DECIMAL (10, 3) NULL,
    [AllCandidateN]        DECIMAL (10, 3) NULL,
    [AllCandidatePass]     INT             NULL,
    [FirstTimeN]           INT             NULL,
    [FirstTimePass]        INT             NULL,
    [FirstTimePassRate]    DECIMAL (10, 3) NULL,
    [AsOfDate]             DATE            DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([PassRateId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_PortionMeasures_TestPortionKey]
    ON [Summary].[PortionMeasures]([TestPortionKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PassRates_TestPortionName]
    ON [Summary].[PortionMeasures]([PortionName] ASC);

