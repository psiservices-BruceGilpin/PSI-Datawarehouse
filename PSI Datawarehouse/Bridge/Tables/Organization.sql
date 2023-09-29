CREATE TABLE [Bridge].[Organization] (
    [OrganizationId]  INT           IDENTITY (1, 1) NOT NULL,
    [OrgFriendlyName] VARCHAR (266) NOT NULL,
    [RpassOrg]        VARCHAR (50)  NOT NULL,
    [Rundate]         DATETIME      NOT NULL,
    [RunID]           INT           NOT NULL,
    CONSTRAINT [PKOrganizationId] PRIMARY KEY CLUSTERED ([OrganizationId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Organization_RpassOrg]
    ON [Bridge].[Organization]([RpassOrg] ASC);

