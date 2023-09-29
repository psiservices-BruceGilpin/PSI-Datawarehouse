CREATE TABLE [Reporting].[CiscoCSREmailDetail] (
    [CiscoCSREmailDetailID] BIGINT         IDENTITY (1, 1) NOT NULL,
    [CaseID]                INT            NULL,
    [UserKey]               BIGINT         NULL,
    [RoutingQueueKey]       BIGINT         NULL,
    [FirstCreatedDate]      DATE           NULL,
    [FirstCreatedTime]      TIME (7)       NULL,
    [FirstRepliedDate]      DATE           NULL,
    [FirstRepliedTime]      TIME (7)       NULL,
    [Email]                 VARCHAR (1024) NULL,
    [Subject]               VARCHAR (1024) NULL,
    [HourFirstReply]        INT            NULL,
    [RunID]                 INT            NULL,
    [RunDate]               DATETIME       NULL,
    [CheckSum]              INT            NULL,
    CONSTRAINT [PKCiscoCSREmailDetailID] PRIMARY KEY NONCLUSTERED ([CiscoCSREmailDetailID] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_CiscoCSREmailDetail]
    ON [Reporting].[CiscoCSREmailDetail]([CaseID] ASC, [FirstCreatedDate] ASC, [FirstCreatedTime] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CiscoCSREmailDetail_Keys]
    ON [Reporting].[CiscoCSREmailDetail]([UserKey] ASC, [RoutingQueueKey] ASC);

