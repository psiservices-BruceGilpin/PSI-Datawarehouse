CREATE TABLE [Dimensions].[PoolCodes] (
    [PoolCodeId]        BIGINT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]   SMALLINT         NOT NULL,
    [SourcePoolCodeKey] UNIQUEIDENTIFIER NOT NULL,
    [PoolCodeGroupKey]  BIGINT           NULL,
    [PoolTitle]         VARCHAR (50)     NOT NULL,
    [PoolDescription]   VARCHAR (2000)   NULL,
    [LoadDate]          DATETIME         DEFAULT (getdate()) NOT NULL,
    [PoolCodeDBID]      BIGINT           NOT NULL,
    [CheckSum]          BIGINT           NOT NULL,
    [CurrentFlag]       BIT              DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([PoolCodeId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IXPoolCodesSourcePoolCodeKey]
    ON [Dimensions].[PoolCodes]([SourcePoolCodeKey] ASC)
    INCLUDE([LoadDate]);

