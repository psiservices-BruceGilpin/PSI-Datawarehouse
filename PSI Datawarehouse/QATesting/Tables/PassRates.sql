CREATE TABLE [QATesting].[PassRates] (
    [TestAssignment_ID] INT             NOT NULL,
    [Portion_ID]        INT             NOT NULL,
    [scaled_score]      DECIMAL (10, 6) NULL,
    [raw_score]         DECIMAL (10, 6) NULL,
    [Portion_Name]      VARCHAR (100)   NOT NULL,
    [Date]              DATETIME2 (3)   NULL,
    [result]            VARCHAR (20)    NULL
);

