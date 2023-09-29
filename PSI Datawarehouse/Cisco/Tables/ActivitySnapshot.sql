CREATE TABLE [Cisco].[ActivitySnapshot] (
    [ActivitySnapshotID]       BIGINT         IDENTITY (1, 1) NOT NULL,
    [Date]                     DATE           NULL,
    [Time]                     TIME (7)       NULL,
    [SourceSystemKey]          INT            NULL,
    [EntryPointKey]            INT            NULL,
    [AgentsKey]                INT            NULL,
    [CustomerKey]              BIGINT         NULL,
    [ActivityID]               INT            NULL,
    [CaseID]                   INT            NULL,
    [ReferrerURLID]            INT            NULL,
    [ReferrerURLName]          VARCHAR (26)   NULL,
    [DeptID]                   INT            NULL,
    [DeptName]                 VARCHAR (27)   NULL,
    [AbandonDateTime]          BIGINT         NULL,
    [FirstPickupDateTime]      BIGINT         NULL,
    [CustomerExitDateTime]     BIGINT         NULL,
    [AssignedUserExitDateTime] BIGINT         NULL,
    [CompletionDateTime]       BIGINT         NULL,
    [WaitTime]                 INT            NULL,
    [ChatDuration]             INT            NULL,
    [FollupUpEmailSent]        VARCHAR (23)   NULL,
    [ActivityPriority]         SMALLINT       NULL,
    [ChatTopic]                VARCHAR (1054) NULL,
    [RunID]                    INT            NULL,
    [EffectiveFrom]            DATETIME       NULL,
    [CheckSum]                 INT            NULL,
    [EffectiveTo]              DATETIME       CONSTRAINT [dfActivitySnapshotEffectiveTo] DEFAULT ('2999-12-31') NULL,
    CONSTRAINT [PKActivitySnapshotID] PRIMARY KEY NONCLUSTERED ([ActivitySnapshotID] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_ActivitySnapshot_Column]
    ON [Cisco].[ActivitySnapshot]([ActivityID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ActivitySnapshot_Column_Keys]
    ON [Cisco].[ActivitySnapshot]([EntryPointKey] ASC, [AgentsKey] ASC, [CustomerKey] ASC);

