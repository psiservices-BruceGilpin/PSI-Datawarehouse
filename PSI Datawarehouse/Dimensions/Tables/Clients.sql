CREATE TABLE [Dimensions].[Clients] (
    [ClientId]         INT           IDENTITY (1, 1) NOT NULL,
    [ClientDBID]       INT           NULL,
    [CurrentFlag]      BIT           DEFAULT ((0)) NOT NULL,
    [SourceSystemKey]  SMALLINT      NOT NULL,
    [SourceSystemID]   VARCHAR (20)  NULL,
    [CreateDate]       DATETIME      DEFAULT (getdate()) NOT NULL,
    [Code]             VARCHAR (16)  NOT NULL,
    [Description]      VARCHAR (256) NOT NULL,
    [AtlasAccountCode] VARCHAR (32)  NOT NULL,
    [PoolKey]          BIGINT        NULL,
    [Checksum]         BIGINT        NOT NULL,
    PRIMARY KEY CLUSTERED ([ClientId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Clients_CurrentFlag]
    ON [Dimensions].[Clients]([CurrentFlag] ASC)
    INCLUDE([ClientDBID]);

