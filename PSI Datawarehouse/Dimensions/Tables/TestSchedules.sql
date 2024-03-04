CREATE TABLE [Dimensions].[TestSchedules] (
    [TestScheduleId]       BIGINT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]      SMALLINT         NOT NULL,
    [SourceTestScheduleID] UNIQUEIDENTIFIER NOT NULL,
    [TestScheduleDBId]     BIGINT           NOT NULL,
    [CurrentFlag]          BIT              NOT NULL,
    [TestPackageKey]       INT              NULL,
    [TestScheduleTitle]    VARCHAR (100)    NOT NULL,
    [TestScheduleDesc]     VARCHAR (2000)   NULL,
    [WebTitle]             VARCHAR (200)    NULL,
    [ScheduleStart]        DATETIME         NULL,
    [ScheduleEnd]          DATETIME         NULL,
    [CreatedDate]          DATETIME         NULL,
    [Preview]              BIT              NOT NULL,
    [ToStudent]            BIT              NOT NULL,
    [ToInstructor]         BIT              NOT NULL,
    [ToNotify]             BIT              NOT NULL,
    [CaptureImage]         BIT              NOT NULL,
    [CaptureBiometric]     BIT              NOT NULL,
    [DisplayImage]         BIT              NOT NULL,
    [LoginTimeLimit]       INT              NOT NULL,
    [Logoff]               BIT              NOT NULL,
    [AltLogoff]            BIT              NOT NULL,
    [ToAdditonal]          INT              NOT NULL,
    [Class]                INT              NOT NULL,
    [Locked]               INT              NOT NULL,
    [Status]               INT              NOT NULL,
    [RedirectToExit]       BIT              NOT NULL,
    [Culture]              VARCHAR (50)     NULL,
    [CheckSum]             BIGINT           NOT NULL,
    [LoadDate]             DATETIME         DEFAULT (getdate()) NOT NULL,
    [StudentGroupKey] INT NULL, 
    PRIMARY KEY CLUSTERED ([TestScheduleId] ASC)
);


GO


CREATE INDEX [IX_TestSchedules_CCurrentFlag] ON [Dimensions].[TestSchedules] ([CurrentFlag])
Include ([TestScheduleDBID],[StudentGroupKey])
