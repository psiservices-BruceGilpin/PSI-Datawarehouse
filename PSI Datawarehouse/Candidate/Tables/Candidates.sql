CREATE TABLE [Candidate].[Candidates] (
    [CandidateId]           INT              IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]       INT              NOT NULL,
    [SourceCandidateKey]    VARCHAR (20)     NULL,
    [CandidateAltKey]       VARCHAR (256)    NOT NULL,
    [FirstName]             VARCHAR (256)    DEFAULT (' ') NOT NULL,
    [LastName]              VARCHAR (256)    NOT NULL,
    [TestKey]               INT              DEFAULT ((0)) NULL,
    [RegistrationDate]      DATE             NOT NULL,
    [RegistrationTypeKey]   INT              NULL,
    [ExpirationDate]        DATE             NULL,
    [StatusCode]            VARCHAR (8)      NOT NULL,
    [SchoolKey]             INT              NULL,
    [SuspectedForFraud]     BIT              NOT NULL,
    [DOB]                   VARCHAR (255)    NULL,
    [EmailAddress]          VARCHAR (255)    NULL,
    [StreetAddress1]        VARCHAR (255)    NULL,
    [StreetAddress2]        VARCHAR (255)    NULL,
    [City]                  VARCHAR (255)    NULL,
    [State]                 VARCHAR (256)    NULL,
    [PostalCode]            VARCHAR (10)     NULL,
    [Country]               VARCHAR (256)    NULL,
    [CreatedDate]           DATETIME         DEFAULT (getdate()) NOT NULL,
    [CurrentFlag]           BIT              DEFAULT ((0)) NULL,
    [CheckSum]              INT              NOT NULL,
    [RunID]                 INT              NOT NULL,
    [CandidateTypeKey]      SMALLINT         NULL,
    [CandidateDBId]         INT              NULL,
    [AtlasCloudCandidateID] BIGINT           NULL,
    [DimensionsStudentID]   UNIQUEIDENTIFIER NULL,
    [Birthdate]             DATE             NULL,
    [GenderCode]            INT              NULL,
    [AgeRangeCode]          INT              NULL,
    [EducationCode]         INT              NULL,
    [LanguageCode]          INT              NULL,
    [RaceCode]              INT              NULL,
    [EthnicityCode]         INT              NULL,
    PRIMARY KEY CLUSTERED ([CandidateId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Candidates_SourceCandidateKey]
    ON [Candidate].[Candidates]([SourceCandidateKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Candidates_Names]
    ON [Candidate].[Candidates]([LastName] ASC, [FirstName] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Candidates_TestKey]
    ON [Candidate].[Candidates]([TestKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Candidates_CandidateDBID]
    ON [Candidate].[Candidates]([CandidateDBId] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_Candidates_CurrentFlag]
    ON [Candidate].[Candidates]([CurrentFlag] ASC,[RegistrationDate],[ExpirationDate])
    INCLUDE([SourceSystemKey],[TestKey],[SchoolKey],[CandidateTypeKey],[Candidatedbid],[CandidateAltKey]);

