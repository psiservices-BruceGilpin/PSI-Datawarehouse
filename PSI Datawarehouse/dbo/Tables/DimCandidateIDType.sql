CREATE TABLE [dbo].[DimCandidateIDType] (
    [CandidateTypeId] INT          IDENTITY (1, 1) NOT NULL,
    [CandidateIDType] VARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED ([CandidateTypeId] ASC)
);

