CREATE TABLE [Aspen].[Clients] (
    [AspenClientId]    INT              IDENTITY (1, 1) NOT NULL,
    [AspenClientDBID]  INT              NOT NULL,
    [CurrentFlag]      BIT              DEFAULT ((0)) NOT NULL,
    [SourceSystemKey]  SMALLINT         NOT NULL,
    [SourceSystemID]   VARCHAR (20)     NOT NULL,
    [ClientName]       VARCHAR (200)    NOT NULL,
    [ClientNumber]     VARCHAR (2)      NULL,
    [ExamWaitFlag]     BIT              NULL,
    [ExamWaitDays]     SMALLINT         NULL,
    [EnforceExamOrder] BIT              NULL,
    [Category]         VARCHAR (30)     NULL,
    [GlobalAccountID]  VARCHAR (10)     NULL,
    [AffiliationGUID]  UNIQUEIDENTIFIER NULL,
    PRIMARY KEY CLUSTERED ([AspenClientId] ASC)
);

