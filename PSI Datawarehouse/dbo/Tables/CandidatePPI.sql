CREATE TABLE [dbo].[CandidatePPI] (
    [PPIID]            BIGINT        IDENTITY (1, 1) NOT NULL,
    [CandidateKey]     BIGINT        NOT NULL,
    [CurrentFlag]      BIT           DEFAULT ((0)) NOT NULL,
    [CandidateTypeKey] SMALLINT      NOT NULL,
    [DwSourceTable]    VARCHAR (50)  NOT NULL,
    [IdentityValue]    VARCHAR (256) NULL,
    [CreateDate]       DATETIME      DEFAULT (getdate()) NOT NULL,
    [PPIDbId]          BIGINT        NOT NULL,
    PRIMARY KEY CLUSTERED ([PPIID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_CandidateIDXref_DWSourceCandidateKey]
    ON [dbo].[CandidatePPI]([IdentityValue] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CandidatePPI_CurrentFlag]
    ON [dbo].[CandidatePPI]([CurrentFlag] ASC)
    INCLUDE([PPIDbId]);


GO
CREATE NONCLUSTERED INDEX [IX_CandidatePPI_CandidateTypeKey]
    ON [dbo].[CandidatePPI]([CandidateKey] ASC)
    INCLUDE([CandidateTypeKey], [IdentityValue]);

