CREATE TABLE [Summary].[SchoolMeasures] (
    [SchoolPassRateeId]      INT             IDENTITY (1, 1) NOT NULL,
    [SchoolKey]              INT             NOT NULL,
    [PortionKey]             INT             NOT NULL,
    [PrelicensingSchoolName] VARCHAR (100)   NULL,
    [FormName]               VARCHAR (50)    NULL,
    [AsOfDate]               DATE            NOT NULL,
    [AllCandidatePassRate]   DECIMAL (10, 3) NULL,
    [AllCandidateN]          INT             NULL,
    [AllCandidatePass]       INT             NULL,
    [FirstTimeN]             INT             NULL,
    [FirstTimePass]          INT             NULL,
    [FirstTimePassRate]      DECIMAL (10, 3) NULL,
    PRIMARY KEY CLUSTERED ([SchoolPassRateeId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_SchoolMeasures_SchoolKey]
    ON [Summary].[SchoolMeasures]([SchoolKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SchoolMeasures_AsOfDate]
    ON [Summary].[SchoolMeasures]([AsOfDate] ASC);

