CREATE TABLE [Test].[TestCenterSchedule] (
    [TestCenterScheduleId]   INT          IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]        INT          NOT NULL,
    [SourceTestCenterSchKey] VARCHAR (20) NOT NULL,
    [BookingCode]            VARCHAR (20) NOT NULL,
    [TestCenterKey]          INT          NOT NULL,
    [ScheduleDate]           DATETIME     NULL,
    [StartDate]              DATE         NOT NULL,
    [StartTime]              TIME (7)     NOT NULL,
    [EndDate]                DATE         NULL,
    [EndTime]                TIME (7)     NULL,
    [Duration]               INT          NULL,
    [TestCenterStatus]       VARCHAR (7)  NULL,
    [CreatedDate]            DATE         CONSTRAINT [dfTestCenterScheduleCreatedDate] DEFAULT (getdate()) NOT NULL,
    [Runid]                  INT          NOT NULL,
    [Checksum]               INT          NOT NULL,
    [TestCenterScheduleDBID] INT          NULL,
    [CurrentFlag]            BIT          CONSTRAINT [dfTestCenterScheduleCurrentFlag] DEFAULT ((0)) NOT NULL,
    [SeatCount]              INT          NULL,
    [AvailableSeatCount]     INT          NULL,
    PRIMARY KEY CLUSTERED ([TestCenterScheduleId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_TestCenterSchedule_TestCenterScheduleDBID]
    ON [Test].[TestCenterSchedule]([TestCenterScheduleDBID] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_TestCenterSchedule_CurrentFlag]
    ON [Test].[TestCenterSchedule]([CurrentFlag] ASC)
    INCLUDE([TestCenterKey], [TestCenterStatus], [TestCenterScheduleDBID]);

