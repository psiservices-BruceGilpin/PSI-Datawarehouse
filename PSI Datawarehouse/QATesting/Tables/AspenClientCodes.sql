CREATE TABLE [QATesting].[AspenClientCodes] (
    [AspenClientID] INT          IDENTITY (1, 1) NOT NULL,
    [ClientCode]    VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_AspenClientCodes] PRIMARY KEY CLUSTERED ([AspenClientID] ASC)
);

