CREATE TABLE [GlobalTestResults].[TestSchedules] (
    [GlobalTestScheduleId] BIGINT       IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]      SMALLINT     NOT NULL,
    [ClientCode]           VARCHAR (20) NOT NULL,
    [ExamID]               VARCHAR (20) NOT NULL,
    [ExamPortion]          VARCHAR (20) NOT NULL,
    [FormName]             VARCHAR (20) NOT NULL,
    [StartDate]            DATETIME     NOT NULL,
    [TestCenterID]         VARCHAR (20) NOT NULL,
    [LoadDate]             DATETIME     DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([GlobalTestScheduleId] ASC)
);

