CREATE TABLE [dbo].[DimCountries] (
    [CountryID]         INT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemID]    INT           NOT NULL,
    [SSCountryKey]      VARCHAR (10)  NOT NULL,
    [CountryName]       VARCHAR (100) NOT NULL,
    [CountryCode]       VARCHAR (5)   NOT NULL,
    [SortOrder]         TINYINT       NOT NULL,
    [CreateDate]        DATETIME      NOT NULL,
    [UpdateDate]        DATETIME      NULL,
    [CountryCodeAlpha3] VARCHAR (3)   NULL,
    PRIMARY KEY CLUSTERED ([CountryID] ASC)
);

