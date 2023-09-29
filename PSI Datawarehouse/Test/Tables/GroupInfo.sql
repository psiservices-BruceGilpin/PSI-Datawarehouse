CREATE TABLE [Test].[GroupInfo] (
    [GroupInfoId]             BIGINT        IDENTITY (1, 1) NOT NULL,
    [GroupInfoDBID]           BIGINT        NOT NULL,
    [CurrentFlag]             BIT           DEFAULT ((0)) NOT NULL,
    [SourceSystemID]          SMALLINT      NOT NULL,
    [SourceSystemGroupInfoID] VARCHAR (25)  NOT NULL,
    [GroupName]               VARCHAR (250) NOT NULL,
    [NumberOfItems]           INT           NULL,
    [PortionKey]              INT           NOT NULL,
    [Checksum]                BIGINT        NOT NULL,
    [LoadDate]                DATETIME      DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([GroupInfoId] ASC)
);

