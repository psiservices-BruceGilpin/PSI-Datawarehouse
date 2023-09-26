CREATE TABLE [dbo].[DimTestType] (
    [TestTypeId]          INT          IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]     TINYINT      NOT NULL,
    [TestType]            VARCHAR (20) NOT NULL,
    [TestTypeDescription] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([TestTypeId] ASC)
);

