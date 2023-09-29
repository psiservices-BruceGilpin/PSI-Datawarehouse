CREATE TABLE [Aspen].[Schedule] (
    [ScheduleId]       INT          IDENTITY (1, 1) NOT NULL,
    [Scheduledbid]     INT          NOT NULL,
    [CurrentFlag]      BIT          DEFAULT ((0)) NOT NULL,
    [SourceSystemKey]  SMALLINT     NOT NULL,
    [SourceSystemID]   VARCHAR (20) NOT NULL,
    [CreateDate]       DATETIME     NOT NULL,
    [ApplicationKey]   INT          NOT NULL,
    [AtlasScheduleKey] INT          NULL,
    [DateScheduled]    DATE         NOT NULL,
    [ExamPortionKey]   INT          NOT NULL,
    [Reschedule]       BIT          NULL,
    [TestResult]       NCHAR (10)   NULL,
    [SupervisorMode]   CHAR (1)     NULL,
    [TimeScheduled]    TIME (7)     NULL,
    [TestCenterKey]    VARCHAR (12) NULL,
    PRIMARY KEY CLUSTERED ([ScheduleId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Schedule_ApplicationKey]
    ON [Aspen].[Schedule]([ApplicationKey] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_Schedule_AtlasScheduleKey]
    ON [Aspen].[Schedule]([AtlasScheduleKey] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_Schedule_CurrentFlag]
    ON [Aspen].[Schedule]([CurrentFlag] ASC)
    INCLUDE([Scheduledbid]);


GO
CREATE NONCLUSTERED INDEX [IX_Schedule_ScheduleKey]
    ON [Aspen].[Schedule]([SourceSystemID] ASC) WHERE ([CurrentFlag]=(0));

