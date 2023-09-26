CREATE TABLE [Candidate].[TestAssignments] (
    [TestAssignmentId]    INT          IDENTITY (1, 1) NOT NULL,
    [SourceTestAssignKey] VARCHAR (20) NOT NULL,
    [SourceSystemKey]     INT          NOT NULL,
    [TestKey]             INT          NOT NULL,
    [AccountKey]          INT          NOT NULL,
    [CandidateKey]        INT          NOT NULL,
    [TestScheduleKey]     INT          NOT NULL,
    [TestDate]            DATETIME     NOT NULL,
    [StartTime]           DATETIME     NULL,
    [EndTime]             DATE         NULL,
    [TotalElapsedTime]    INT          NULL,
    [CheckInTime]         DATETIME     NULL,
    [UpdloadMode]         VARCHAR (10) NULL,
    [CreateDate]          DATETIME     DEFAULT (getdate()) NOT NULL,
    [CurrentFlag]         BIT          DEFAULT ((0)) NOT NULL,
    [RunID]               INT          NOT NULL,
    [CheckinLanguageKey]  INT          NULL,
    [ProctorLanguageKey]  INT          NULL,
    [TestAssignmentDBID]  INT          NULL,
    [DeleiveryMethodKey]  INT          NULL,
    [EligibilityDate]     DATE         NULL,
    [SeatID]              INT          NULL,
    [SeatCode]            VARCHAR (15) NULL,
    PRIMARY KEY CLUSTERED ([TestAssignmentId] ASC),
    CONSTRAINT [FK_TestAssignments_Candidate] FOREIGN KEY ([CandidateKey]) REFERENCES [Candidate].[Candidates] ([CandidateId]),
    CONSTRAINT [FK_TestAssignments_SourceSystem] FOREIGN KEY ([SourceSystemKey]) REFERENCES [dbo].[SourceSystems] ([SourceSystemId])
);


GO
CREATE NONCLUSTERED INDEX [IX_TestAssignments_CandidateKey]
    ON [Candidate].[TestAssignments]([CandidateKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TestAssignments_AccountKey]
    ON [Candidate].[TestAssignments]([AccountKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TestAssignments_Column]
    ON [Candidate].[TestAssignments]([TestKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TestAssignments_TestAssignmentDBKey]
    ON [Candidate].[TestAssignments]([TestAssignmentDBID] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_TestAssignments_SourceTestAssignKeyCurrentflag]
    ON [Candidate].[TestAssignments]([SourceTestAssignKey] ASC, [CurrentFlag] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TestAssignments_CurrentFlag]
    ON [Candidate].[TestAssignments]([CurrentFlag] ASC, [TestDate] ASC)
    INCLUDE([TestKey], [CandidateKey], [TestAssignmentDBID], [DeleiveryMethodKey]);

