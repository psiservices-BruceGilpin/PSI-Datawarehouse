CREATE TABLE [Reporting].[NHARPData] (
    [NHARPDataID]                    BIGINT             IDENTITY (1, 1) NOT NULL,
    [CandidateAltKey]                VARCHAR (255)      NULL,
    [BookingCode]                    VARCHAR (20)       NULL,
    [GlobalScheduleID]               VARCHAR (20)       NULL,
    [Exam]                           VARCHAR (100)      NULL,
    [ScheduleStatus]                 VARCHAR (70)       NULL,
    [Result]                         VARCHAR (20)       NULL,
    [TestCenter]                     VARCHAR (100)      NULL,
    [ScheduledStartDatePST]          DATE               NULL,
    [ScheduledStartTimePST]          DATETIMEOFFSET (0) NULL,
    [TestLaunchDatePST]              DATETIME           NULL,
    [ScheduleStartvsActualStartMins] INT                NULL,
    [OpenFireDuration]               INT                NULL,
    [RunID]                          INT                NULL,
    [RunDate]                        DATETIME           NULL,
    [CheckSum]                       INT                NULL,
    CONSTRAINT [PKNHARPDataID] PRIMARY KEY NONCLUSTERED ([NHARPDataID] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_NHARPData]
    ON [Reporting].[NHARPData]([BookingCode] ASC, [GlobalScheduleID] ASC, [Exam] ASC);

