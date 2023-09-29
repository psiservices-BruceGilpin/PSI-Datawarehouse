CREATE TABLE [Dimensions].[Pools] (
    [PoolId]           BIGINT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]  SMALLINT         NOT NULL,
    [SourcePoolID]     UNIQUEIDENTIFIER NOT NULL,
    [PoolDbID]         BIGINT           NOT NULL,
    [PoolCodeGroupKey] BIGINT           NULL,
    [PoolTitle]        VARCHAR (50)     NOT NULL,
    [PoolDesc]         VARCHAR (2000)   NULL,
    [LoadDate]         DATETIME         DEFAULT (getdate()) NOT NULL,
    [CheckSum]         BIGINT           NOT NULL,
    [CurrentFlag]      BIT              DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([PoolId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Pools_PoolDBID]
    ON [Dimensions].[Pools]([PoolDbID] ASC)
    INCLUDE([PoolTitle]) WHERE ([currentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_Pools_CodeGroupKey]
    ON [Dimensions].[Pools]([PoolCodeGroupKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Pools_Currentflag]
    ON [Dimensions].[Pools]([CurrentFlag] ASC)
    INCLUDE([PoolDbID]);

