CREATE TABLE [Aspen].[Applications] (
    [ApplicationId]        INT            IDENTITY (1, 1) NOT NULL,
    [ApplicationDBID]      INT            NOT NULL,
    [CurrentFlag]          BIT            DEFAULT ((0)) NOT NULL,
    [SourceSystemKey]      SMALLINT       NOT NULL,
    [SourceSystemID]       VARCHAR (20)   NOT NULL,
    [AdaAddedMinutes]      INT            NULL,
    [AdaMultiplier]        DECIMAL (3, 2) NULL,
    [ApplicantID]          VARCHAR (12)   NULL,
    [ApplicationDate]      DATE           NULL,
    [ApplicationSource]    VARCHAR (2)    NULL,
    [AtlasRegistrationID]  VARCHAR (19)   NULL,
    [ClientCode]           VARCHAR (2)    NULL,
    [DeliveryMethod]       VARCHAR (10)   NULL,
    [EligibilityBeginDate] DATE           NULL,
    [EligibilityEndDate]   DATE           NULL,
    [EnrollmentDate]       DATE           NULL,
    [ExamId]               VARCHAR (12)   NULL,
    [FirmLicense]          VARCHAR (6)    NULL,
    [GraduationDate]       DATE           NULL,
    [PersonKey]            INT            NULL,
    [Reapplicant]          BIT            NULL,
    [Recertification]      BIT            NULL,
    [ReleaseScores]        BIT            NULL,
    [StatusDate]           DATE           NULL,
    [Checksum]             BIGINT         NULL,
    [CreateDate]           NCHAR (10)     NULL,
    PRIMARY KEY CLUSTERED ([ApplicationId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Applications_ApplicantID]
    ON [Aspen].[Applications]([ApplicantID] ASC) WHERE ([currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_Applications_CurrentFlag]
    ON [Aspen].[Applications]([CurrentFlag] ASC)
    INCLUDE([ApplicationDBID], [ExamId], [ApplicantID]);


GO
CREATE NONCLUSTERED INDEX [IX_Applications_ExamID]
    ON [Aspen].[Applications]([ExamId] ASC) WHERE ([currentflag]=(0));

