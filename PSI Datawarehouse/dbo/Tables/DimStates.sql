CREATE TABLE [dbo].[DimStates] (
    [DimStateID]        SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CountryId]         INT           NOT NULL,
    [StateAbbreviation] VARCHAR (2)   NOT NULL,
    [StateName]         VARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([DimStateID] ASC)
);

