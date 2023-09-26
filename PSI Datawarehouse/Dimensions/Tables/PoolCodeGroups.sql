CREATE TABLE [Dimensions].[PoolCodeGroups] (
    [PoolCodeGroupId]      BIGINT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]      SMALLINT         NOT NULL,
    [SourcePoolGroupID]    UNIQUEIDENTIFIER NOT NULL,
    [PoolCodeGroupDBID]    BIGINT           NOT NULL,
    [PoolKey]              BIGINT           NULL,
    [PoolGroupTitle]       VARCHAR (50)     NOT NULL,
    [PoolGroupDescription] VARCHAR (2000)   NULL,
    [LoadDate]             DATETIME         DEFAULT (getdate()) NOT NULL,
    [CurrentFlag]          BIT              DEFAULT ((0)) NOT NULL,
    [CheckSum]             BIGINT           NOT NULL,
    PRIMARY KEY CLUSTERED ([PoolCodeGroupId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IXPoolCodeGroupsSourcePoolGroupID]
    ON [Dimensions].[PoolCodeGroups]([SourcePoolGroupID] ASC)
    INCLUDE([LoadDate]);

