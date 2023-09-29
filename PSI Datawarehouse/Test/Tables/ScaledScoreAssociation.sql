CREATE TABLE [Test].[ScaledScoreAssociation] (
    [Id]                    INT             IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]       SMALLINT        NOT NULL,
    [SourceSystemMappingID] INT             NOT NULL,
    [ScaledScoreAssnDBID]   INT             NOT NULL,
    [CurrentFlag]           BIT             NOT NULL,
    [LoadDate]              DATETIME        NOT NULL,
    [PortionKey]            BIGINT          NOT NULL,
    [FormKey]               BIGINT          NOT NULL,
    [SCName]                VARCHAR (100)   NOT NULL,
    [RawScore]              DECIMAL (10, 3) NOT NULL,
    [ScaledScore]           DECIMAL (10, 3) NOT NULL,
    [Checksum]              BIGINT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ScaledScoreAssociation_FormKey]
    ON [Test].[ScaledScoreAssociation]([FormKey] ASC)
    INCLUDE([PortionKey]);


GO
CREATE NONCLUSTERED INDEX [IX_ScaledScoreAssociation_PortionKey]
    ON [Test].[ScaledScoreAssociation]([PortionKey] ASC)
    INCLUDE([FormKey]);

