CREATE TABLE [Staging].[StagingNHAAbsentAndTestedCandidates] (
    [BookingCode]    VARCHAR (20)  NULL,
    [TestedStatus]   VARCHAR (70)  NULL,
    [TestDate]       VARCHAR (30)  NULL,
    [TestName]       VARCHAR (100) NULL,
    [TestCenterName] VARCHAR (100) NULL,
    [City]           VARCHAR (30)  NULL,
    [State]          VARCHAR (30)  NULL,
    [Country]        VARCHAR (100) NULL,
    [RunID]          INT           NULL,
    [RunDate]        DATETIME      NULL,
    [CheckSum]       INT           NULL
);


GO
CREATE CLUSTERED INDEX [CX_StagingNHAAbsentAndTestedCandidates]
    ON [Staging].[StagingNHAAbsentAndTestedCandidates]([BookingCode] ASC, [TestDate] ASC, [TestName] ASC);

