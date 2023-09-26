CREATE TABLE [dbo].[CandidateAddresses] (
    [CandidateAddressId]       BIGINT        IDENTITY (1, 1) NOT NULL,
    [CandidateAddressDBID]     BIGINT        NOT NULL,
    [CurrentFlag]              BIT           DEFAULT ((0)) NOT NULL,
    [SourceSystemID]           SMALLINT      NOT NULL,
    [CandidatesKey]            INT           NOT NULL,
    [SourceSystemCandidateKey] VARCHAR (25)  NOT NULL,
    [EmailAddress]             VARCHAR (100) NULL,
    [StreetAddress]            VARCHAR (50)  NULL,
    [Unit]                     VARCHAR (20)  NULL,
    [City]                     VARCHAR (50)  NULL,
    [State]                    VARCHAR (10)  NULL,
    [PostalCode]               VARCHAR (15)  NULL,
    [CheckSum]                 BIGINT        NOT NULL,
    [Loaddate]                 DATETIME      DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([CandidateAddressId] ASC),
    CONSTRAINT [FK_CandidateAddresses_Candidates] FOREIGN KEY ([CandidatesKey]) REFERENCES [Candidate].[Candidates] ([CandidateId])
);


GO
CREATE NONCLUSTERED INDEX [IX_CandidateAddresses_CandidateDBID]
    ON [dbo].[CandidateAddresses]([CandidateAddressDBID] ASC) WHERE ([Currentflag]=(0));

