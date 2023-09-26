CREATE TABLE [Dimensions].[StudentScores] (
    [StudentScoreId]       BIGINT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]      SMALLINT         NOT NULL,
    [SourceStudentScoreID] UNIQUEIDENTIFIER NOT NULL,
    [StudentScoreDBID]     BIGINT           NOT NULL,
    [CurrentFlag]          BIT              DEFAULT ((0)) NOT NULL,
    [StudentListKey]       BIGINT           NULL,
    [TestScheduleKey]      BIGINT           NULL,
    [TestListKey]          BIGINT           NULL,
    [TestCenterKey]        INT              NULL,
    [ScoreStatus]          INT              NOT NULL,
    [StartDate]            DATETIME         NULL,
    [Enddate]              DATETIME         NULL,
    [ScorePoints]          INT              NULL,
    [Restarts]             INT              NULL,
    [Version]              INT              NULL,
    [OrderSeed]            INT              NULL,
    [HowLong]              INT              NULL,
    [Warn]                 BIT              NULL,
    [Retake]               INT              NULL,
    [ExtraTime]            INT              NULL,
    [ExtraTimeUsed]        INT              NULL,
    [ReportDate]           DATETIME         NULL,
    [Reports]              INT              NULL,
    [Sim]                  BIT              NOT NULL,
    [PFA]                  VARCHAR (2)      NULL,
    [AdaTime]              INT              NOT NULL,
    [ExtraStatus]          INT              NOT NULL,
    [ExtraStart]           DATETIME         NULL,
    [ExtraEnd]             DATETIME         NULL,
    [Proctored]            BIT              NOT NULL,
    [NewSchedEnd]          DATETIME         NULL,
    [FinalPoints]          INT              NULL,
    [ExtraPoints]          INT              NULL,
    [ScaledScore]          INT              NULL,
    [CheckSum]             BIGINT           NOT NULL,
    [LoadDate]             DATETIME         DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([StudentScoreId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_StudentScores_CurrentFlag]
    ON [Dimensions].[StudentScores]([CurrentFlag] ASC)
    INCLUDE([StudentListKey], [TestListKey], [StartDate]);


GO
CREATE NONCLUSTERED INDEX [IX_StudentScores_StudentListKey]
    ON [Dimensions].[StudentScores]([StudentListKey] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_StudentScores_StudentScoreDBID]
    ON [Dimensions].[StudentScores]([StudentScoreDBID] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_StudentScores_TestListKey]
    ON [Dimensions].[StudentScores]([TestListKey] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_StudentScores_TestScheduleKey]
    ON [Dimensions].[StudentScores]([TestScheduleKey] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IXStudentScoresSourceStudentScoreID]
    ON [Dimensions].[StudentScores]([SourceStudentScoreID] ASC)
    INCLUDE([StudentScoreDBID], [CurrentFlag], [LoadDate]);

