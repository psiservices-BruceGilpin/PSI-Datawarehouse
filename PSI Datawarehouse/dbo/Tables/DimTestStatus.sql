CREATE TABLE [dbo].[DimTestStatus] (
    [TestStatusId]          INT          IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]       SMALLINT     NOT NULL,
    [TestStatus]            VARCHAR (20) NOT NULL,
    [TestStatusDescription] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([TestStatusId] ASC)
);

