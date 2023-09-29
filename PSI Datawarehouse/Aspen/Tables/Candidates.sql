CREATE TABLE [Aspen].[Candidates] (
    [AspenCandidateId]   INT          IDENTITY (1, 1) NOT NULL,
    [AspenCandidateDBId] INT          NOT NULL,
    [CurrentFlag]        BIT          NOT NULL,
    [SourceSystemKey]    SMALLINT     NOT NULL,
    [SourceSystemKID]    VARCHAR (20) NOT NULL,
    [CreateDate]         DATETIME     DEFAULT (getdate()) NOT NULL,
    [FirstName]          VARCHAR (25) NOT NULL,
    [LastName]           VARCHAR (30) NOT NULL,
    [Address1]           VARCHAR (35) NOT NULL,
    [Address2]           VARCHAR (35) NULL,
    [City]               VARCHAR (50) NOT NULL,
    [ZipCode]            VARCHAR (5)  NULL,
    [county]             VARCHAR (20) NULL,
    [CountryKey]         INT          NULL,
    [Gender]             CHAR (1)     NOT NULL,
    [Birthdate]          DATE         NULL,
    [ArelloScan]         DATE         NULL,
    [ArelloStatus]       SMALLINT     NULL,
    [TextAcceptanceDate] DATE         NULL,
    PRIMARY KEY CLUSTERED ([AspenCandidateId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Candidates_ApplicantName]
    ON [Aspen].[Candidates]([LastName] ASC, [FirstName] ASC) WHERE ([currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_Candidates_Currentflag]
    ON [Aspen].[Candidates]([CurrentFlag] ASC)
    INCLUDE([AspenCandidateDBId]);

