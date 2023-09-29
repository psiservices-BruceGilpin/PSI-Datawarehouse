CREATE TABLE [Bridge].[TestSession] (
    [TestSessionId]         BIGINT          IDENTITY (1, 1) NOT NULL,
    [DossierKey]            VARCHAR (40)    NOT NULL,
    [SessionKey]            VARCHAR (40)    NOT NULL,
    [CandidateKey]          INT             NULL,
    [RequestorCandidateKey] VARCHAR (40)    NULL,
    [TestKey]               INT             NULL,
    [FName]                 VARCHAR (100)   NOT NULL,
    [LName]                 VARCHAR (100)   NOT NULL,
    [Email]                 VARCHAR (255)   NULL,
    [Account]               VARCHAR (30)    NULL,
    [TestDate]              DATE            NULL,
    [Checksum]              INT             NOT NULL,
    [LoadDate]              DATETIME        NOT NULL,
    [LoadKey]               INT             NOT NULL,
    [TestDuration]          DECIMAL (10, 2) NULL,
    [StartTime]             TIME (7)        NULL,
    [PDiddy]                VARCHAR (100)   NULL,
    [BookingCode]           VARCHAR (20)    NULL,
    PRIMARY KEY CLUSTERED ([TestSessionId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_TestSession_TestKey]
    ON [Bridge].[TestSession]([TestKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TestSession_DossierSession]
    ON [Bridge].[TestSession]([DossierKey] ASC, [SessionKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TestSession_TestDate]
    ON [Bridge].[TestSession]([TestDate] ASC)
    INCLUDE([DossierKey], [SessionKey], [Account]);


GO
CREATE NONCLUSTERED INDEX [IX_TestSession_Pdiddy]
    ON [Bridge].[TestSession]([PDiddy] ASC);

