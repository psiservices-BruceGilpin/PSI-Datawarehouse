CREATE TABLE [dbo].[Country] (
    [CountryId]         INT           IDENTITY (1, 1) NOT NULL,
    [CountryName]       VARCHAR (100) NOT NULL,
    [CountryCode]       VARCHAR (5)   NOT NULL,
    [CountryCodeAlpha3] VARCHAR (5)   NOT NULL,
    [ToBeListed]        BIT           NOT NULL,
    [USGroup]           BIT           NOT NULL,
    [Checksum]          INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([CountryId] ASC)
);

