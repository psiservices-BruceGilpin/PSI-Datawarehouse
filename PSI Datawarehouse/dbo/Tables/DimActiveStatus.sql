CREATE TABLE [dbo].[DimActiveStatus] (
    [ActiveStatusId]    INT          IDENTITY (1, 1) NOT NULL,
    [ActiveStatusCode]  VARCHAR (25) NOT NULL,
    [ActiveStatusSTate] VARCHAR (35) NOT NULL,
    [SourceSystemID]    TINYINT      NOT NULL,
    [SourceStatusKey]   VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([ActiveStatusId] ASC)
);

