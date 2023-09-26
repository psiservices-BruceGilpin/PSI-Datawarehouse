CREATE TABLE [Candidate].[TestLaunch] (
    [TestLaunchId]          INT      IDENTITY (1, 1) NOT NULL,
    [TestLaunchDBID]        INT      NOT NULL,
    [CandidateKey]          BIGINT   NOT NULL,
    [TestLaunchDate]        DATE     NOT NULL,
    [ValidUpto]             DATE     NULL,
    [CandidateScheduleKey]  INT      NOT NULL,
    [LaunchCount]           INT      NULL,
    [TestContentLaunchDate] DATE     NULL,
    [CreateDate]            DATETIME DEFAULT (getdate()) NOT NULL,
    [CurrentFlag]           BIT      DEFAULT ((0)) NOT NULL,
    [Checksum]              BIGINT   NOT NULL,
    PRIMARY KEY NONCLUSTERED ([TestLaunchId] ASC)
);


GO
CREATE CLUSTERED INDEX [IX_TestLaunch_TestRegn]
    ON [Candidate].[TestLaunch]([CandidateKey] ASC, [CandidateScheduleKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TestLaunch_TestLaunchDBID]
    ON [Candidate].[TestLaunch]([TestLaunchDBID] ASC) WHERE ([currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_TestLaunch_CurrentFlag]
    ON [Candidate].[TestLaunch]([CurrentFlag] ASC)
    INCLUDE([CandidateKey]);

