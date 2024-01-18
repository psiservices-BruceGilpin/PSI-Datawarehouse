CREATE TABLE [Dimensions].[StudentTestAttributes] (
    [StudAttribId]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [StudAttribDBID]        BIGINT          NOT NULL,
    [CurrentFlag]           BIT             DEFAULT ((0)) NOT NULL,
    [LoadDate]              DATETIME        DEFAULT (getdate()) NOT NULL,
    [CheckSum]              BIGINT          NOT NULL,
    [StudentKey]            BIGINT          NOT NULL,
    [TestCenterKey]         INT             NOT NULL,
    [TestScheduleKey]       INT             NOT NULL,
    [ExternalExamKey]       INT             NULL,
    [SchoolCode]            VARCHAR (40)    NULL,
    [ClientCode]            VARCHAR (12)    NULL,
    [ExamCode]              VARCHAR (15)    NULL,
    [ExamPortionCode]       VARCHAR (15)    NULL,
    [GraduationDate]        DATE            NULL,
    [ApplicationType]       VARCHAR (6)     NULL,
    [SchoolName]            VARCHAR (100)   NULL,
    [AdminGroup]            VARCHAR (10)    NULL,
    [TimeSched]             VARCHAR (8)     NULL,
    [DateSched]             DATE            NULL,
    [ExternalApplicantKey]  VARCHAR (25)    NULL,
    [AspenApplicantKey]     VARCHAR (12)    NULL,
    [ExamDescription]       VARCHAR (200)   NULL,
    [AspenSchedID]          VARCHAR (12)    NULL,
    [DeliveryMethod]        VARCHAR (8)     NULL,
    [ExternalTestCenterKey] VARCHAR (15)    NULL,
    [FormKey]               INT             NULL,
    [ExternalSchoolKey]     NCHAR (10)      NULL,
    [BookingCode]           VARCHAR (50)    NULL,
    [Client]                VARCHAR (120)   NULL,
    [ADAMultiplier]         DECIMAL (10, 4) NULL,
    [ADAEnable]             CHAR (1)        NULL,
    [OrigExamPortionID]     VARCHAR (20)    NULL,
    [NationStateCd]         NCHAR (10)      NULL,
    [ComboEnable]           CHAR (1)        NULL,
    [HistoryEnable]         CHAR (1)        NULL,
    [Licsense]              VARCHAR (40)    NULL,
    [Degree]                VARCHAR (50)    NULL,
    [NationStatePFA]        CHAR (1)        NULL,
    [DeploymentEnable]      VARCHAR (10)    NULL,
    [EndEligiblityDate]     DATE            NULL,
    [ResponsibleEmp]        VARCHAR (30)    NULL,
    PRIMARY KEY CLUSTERED ([StudAttribId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_StudentTestAttributes_StudentKey]
    ON [Dimensions].[StudentTestAttributes]([StudentKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_StudentTestAttributes_CurrentFlag]
    ON [Dimensions].[StudentTestAttributes]([CurrentFlag] ASC)
    INCLUDE([StudentKey], [DateSched]);


GO
CREATE NONCLUSTERED INDEX [IXStudentTestAttributesKeys]
    ON [Dimensions].[StudentTestAttributes]([TestScheduleKey] ASC, [ExamPortionCode] ASC, [FormKey] ASC)
    INCLUDE([CurrentFlag], [LoadDate]);


GO

CREATE INDEX [IX_StudentTestAttributes_FlagClient] ON [Dimensions].[StudentTestAttributes] ([CurrentFlag], [ClientCode])
Include ([StudentKey])
