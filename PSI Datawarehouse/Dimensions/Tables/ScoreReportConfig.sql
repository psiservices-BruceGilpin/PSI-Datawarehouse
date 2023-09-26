CREATE TABLE [Dimensions].[ScoreReportConfig] (
    [ScoreConfigId]   INT            IDENTITY (1, 1) NOT NULL,
    [ScoreConfigDBID] INT            NOT NULL,
    [CurrentFlag]     BIT            DEFAULT ((0)) NOT NULL,
    [SourceSystemKey] SMALLINT       NOT NULL,
    [SourceSystemID]  VARCHAR (20)   NOT NULL,
    [CreateDate]      DATETIME       DEFAULT (getdate()) NOT NULL,
    [FormKey]         INT            NOT NULL,
    [BeginDate]       DATETIME       NOT NULL,
    [EndDate]         DATETIME       NULL,
    [Class]           VARCHAR (100)  NOT NULL,
    [ReportPath]      VARCHAR (1000) NULL,
    [PublishDate]     DATETIME       NOT NULL,
    [Provisional]     CHAR (1)       NULL,
    PRIMARY KEY CLUSTERED ([ScoreConfigId] ASC)
);

