CREATE TABLE [dbo].[PPIIdentification] (
    [PPIId]           INT          IDENTITY (1, 1) NOT NULL,
    [PPIDBID]         INT          NOT NULL,
    [CurrentFlag]     BIT          DEFAULT ((0)) NOT NULL,
    [SourceSystemKey] SMALLINT     NOT NULL,
    [SourceSystemID]  VARCHAR (25) NOT NULL,
    [CandidateKey]    BIGINT       NOT NULL,
    [PppIIdType]      NCHAR (10)   NOT NULL,
    [CreateDate]      DATETIME     NOT NULL,
    [ModifyDate]      DATE         NULL,
    PRIMARY KEY CLUSTERED ([PPIId] ASC)
);

