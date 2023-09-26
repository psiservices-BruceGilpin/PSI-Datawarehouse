CREATE TABLE [QATesting].[TestCenters] (
    [Name]                  VARCHAR (255)  NULL,
    [Result_ID]             VARCHAR (20)   NULL,
    [Candidate_ID]          VARCHAR (255)  NULL,
    [FName]                 VARCHAR (255)  NULL,
    [LName]                 VARCHAR (255)  NULL,
    [TestLaunch_Date]       DATETIME       NULL,
    [Scheduled_Date]        DATETIME       NULL,
    [Test_Center_ID]        INT            NULL,
    [Global_Test_Center_ID] NVARCHAR (255) NULL,
    [Schedule_ID]           INT            NULL,
    [Is_Reschedule]         INT            NULL,
    [TestAssignment_ID]     INT            NULL
);

