CREATE TABLE [Bridge].[ProctorSupportXref] (
    [ProctorSupportXrefId] BIGINT IDENTITY (1, 1) NOT NULL,
    [TestSessionKey]       BIGINT NOT NULL,
    [ProctorKey]           INT    NOT NULL,
    PRIMARY KEY CLUSTERED ([ProctorSupportXrefId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ProctorSupportXref_SessionStep]
    ON [Bridge].[ProctorSupportXref]([TestSessionKey] ASC)
    INCLUDE([ProctorKey]);


GO
CREATE NONCLUSTERED INDEX [IX_ProctorSupportXref_ProctorKey]
    ON [Bridge].[ProctorSupportXref]([ProctorKey] ASC)
    INCLUDE([TestSessionKey]);

