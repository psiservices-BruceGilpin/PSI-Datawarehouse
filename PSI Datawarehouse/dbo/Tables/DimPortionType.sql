CREATE TABLE [dbo].[DimPortionType] (
    [PortionIDId]        SMALLINT     IDENTITY (1, 1) NOT NULL,
    [PortionTypeID]      VARCHAR (8)  NOT NULL,
    [PortionName]        VARCHAR (20) NOT NULL,
    [PortionDescription] NCHAR (10)   NULL,
    [SourceSystemKey]    INT          NOT NULL,
    [SourcePortionType]  VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([PortionIDId] ASC)
);

