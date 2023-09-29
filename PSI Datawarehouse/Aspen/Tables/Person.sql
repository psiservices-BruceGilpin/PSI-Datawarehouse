CREATE TABLE [Aspen].[Person] (
    [PersonId]        INT           IDENTITY (1, 1) NOT NULL,
    [PersonDBId]      INT           NOT NULL,
    [CurrentFlag]     BIT           DEFAULT ((0)) NOT NULL,
    [CreateDate]      DATETIME      DEFAULT (getdate()) NOT NULL,
    [SourceSystemKey] SMALLINT      NOT NULL,
    [SourceSystemID]  VARCHAR (20)  NOT NULL,
    [FirstName]       VARCHAR (25)  NOT NULL,
    [LastName]        VARCHAR (30)  NOT NULL,
    [MiddleName]      VARCHAR (25)  NULL,
    [Gender]          CHAR (1)      NOT NULL,
    [Address1]        VARCHAR (35)  NOT NULL,
    [Address2]        VARCHAR (35)  NULL,
    [City]            VARCHAR (50)  NOT NULL,
    [State]           VARCHAR (2)   NULL,
    [ZipCode]         VARCHAR (10)  NULL,
    [CountryCode]     INT           NULL,
    [EMail]           VARCHAR (100) NULL,
    [Birthdate]       DATE          NULL,
    [ArelloScan]      DATE          NULL,
    PRIMARY KEY CLUSTERED ([PersonId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Person_CurrentFlag]
    ON [Aspen].[Person]([CurrentFlag] ASC)
    INCLUDE([PersonDBId]);


GO
CREATE NONCLUSTERED INDEX [IX_Person_Email]
    ON [Aspen].[Person]([EMail] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_Person_Name]
    ON [Aspen].[Person]([LastName] ASC, [FirstName] ASC) WHERE ([CurrentFlag]=(0));

