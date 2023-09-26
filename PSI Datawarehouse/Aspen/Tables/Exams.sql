CREATE TABLE [Aspen].[Exams] (
    [ExamId]                INT          IDENTITY (1, 1) NOT NULL,
    [ExamDBID]              INT          NOT NULL,
    [CurrentFlag]           BIT          DEFAULT ((0)) NOT NULL,
    [SourceSystemKey]       SMALLINT     NOT NULL,
    [SourceSystemID]        VARCHAR (20) NOT NULL,
    [CreateDate]            DATETIME     NOT NULL,
    [ExamCode]              VARCHAR (12) NOT NULL,
    [ClientCode]            VARCHAR (10) NOT NULL,
    [BufferDays]            INT          NULL,
    [RefBooks]              CHAR (1)     NULL,
    [DefaultDeliveryMethod] VARCHAR (10) NULL,
    [ExamCategory]          VARCHAR (12) NULL,
    [RequireSchool]         CHAR (1)     NULL,
    [PortionsPerSession]    INT          NULL,
    [SuAvail]               CHAR (1)     NULL,
    [PortionsPerApp]        CHAR (1)     NULL,
    [RetakeBuffer]          INT          NULL,
    [FuAvail]               CHAR (1)     NULL,
    [TuAvail]               CHAR (1)     NULL,
    [WeAvail]               CHAR (1)     NULL,
    [ThAvail]               CHAR (1)     NULL,
    [MoAvail]               CHAR (1)     NULL,
    [FingerPrint]           CHAR (1)     NULL,
    PRIMARY KEY CLUSTERED ([ExamId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Exams_CurrentFlag]
    ON [Aspen].[Exams]([CurrentFlag] ASC)
    INCLUDE([ExamDBID]);

