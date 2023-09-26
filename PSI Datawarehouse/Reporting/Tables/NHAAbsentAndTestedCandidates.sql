CREATE TABLE [Reporting].[NHAAbsentAndTestedCandidates] (
    [NHAAbsentAndTestedCandidatesID] BIGINT        IDENTITY (1, 1) NOT NULL,
    [BookingCode]                    VARCHAR (20)  NULL,
    [TestedStatus]                   VARCHAR (70)  NULL,
    [TestDate]                       VARCHAR (30)  NULL,
    [TestName]                       VARCHAR (100) NULL,
    [TestCenterName]                 VARCHAR (100) NULL,
    [City]                           VARCHAR (30)  NULL,
    [State]                          VARCHAR (30)  NULL,
    [Country]                        VARCHAR (100) NULL,
    [RunID]                          INT           NULL,
    [RunDate]                        DATETIME      NULL,
    [CheckSum]                       INT           NULL,
    CONSTRAINT [PKNHAAbsentAndTestedCandidatesID] PRIMARY KEY NONCLUSTERED ([NHAAbsentAndTestedCandidatesID] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_NHAAbsentAndTestedCandidates]
    ON [Reporting].[NHAAbsentAndTestedCandidates]([BookingCode] ASC, [TestDate] ASC, [TestName] ASC);

