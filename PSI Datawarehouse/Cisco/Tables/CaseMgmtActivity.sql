CREATE TABLE [Cisco].[CaseMgmtActivity] (
    [CaseMgmtActivityID]     BIGINT         IDENTITY (1, 1) NOT NULL,
    [SourceSystemActivityID] BIGINT         NULL,
    [SourceSystemKey]        INT            NULL,
    [UserKey]                BIGINT         NULL,
    [RoutingQueueKey]        BIGINT         NULL,
    [CaseID]                 INT            NULL,
    [ActivityMode]           SMALLINT       NULL,
    [ActivityType]           SMALLINT       NULL,
    [ActivitySubType]        SMALLINT       NULL,
    [Status]                 SMALLINT       NULL,
    [SubStatus]              SMALLINT       NULL,
    [Priority]               SMALLINT       NULL,
    [CreatedOnDate]          DATE           NULL,
    [CreatedOnTime]          TIME (7)       NULL,
    [ModifiedOnDate]         DATE           NULL,
    [ModifiedOnTime]         TIME (7)       NULL,
    [DueDate]                DATE           NULL,
    [DueTime]                TIME (7)       NULL,
    [Subject]                VARCHAR (1024) NULL,
    [LanguageID]             SMALLINT       NULL,
    [CustomerID]             INT            NULL,
    [ContactPersonID]        INT            NULL,
    [ContactPointID]         INT            NULL,
    [Email]                  VARCHAR (1024) NULL,
    [LastReason]             VARCHAR (200)  NULL,
    [Pinned]                 VARCHAR (1)    NULL,
    [Locked]                 VARCHAR (1)    NULL,
    [FolderID]               INT            NULL,
    [CreatedBy]              INT            NULL,
    [RunID]                  INT            NULL,
    [EffectiveFrom]          DATETIME       NULL,
    [CheckSum]               INT            NULL,
    [EffectiveTo]            DATETIME       CONSTRAINT [dfEffectiveToCaseMgmtActivity] DEFAULT ('2099/12/31') NULL,
    CONSTRAINT [PKCaseMgmtActivityID] PRIMARY KEY NONCLUSTERED ([CaseMgmtActivityID] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_CaseMgmtActivity]
    ON [Cisco].[CaseMgmtActivity]([SourceSystemActivityID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CaseMgmtActivity_Keys]
    ON [Cisco].[CaseMgmtActivity]([UserKey] ASC, [RoutingQueueKey] ASC);

