CREATE TABLE [Dimensions].[Areas] (
    [AreaId]          INT              IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey] SMALLINT         NOT NULL,
    [SourceAreaID]    UNIQUEIDENTIFIER NOT NULL,
    [AreaDBID]        INT              NOT NULL,
    [AreaTitle]       VARCHAR (50)     NOT NULL,
    [AreaDescirption] VARCHAR (2000)   NULL,
    [CurrentFlag]     BIT              DEFAULT ((0)) NOT NULL,
    [CheckSum]        BIGINT           NOT NULL,
    [LoadDate]        DATETIME         DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([AreaId] ASC)
);

