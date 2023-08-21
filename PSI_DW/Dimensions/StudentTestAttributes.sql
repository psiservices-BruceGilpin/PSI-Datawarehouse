CREATE TABLE [dbo].[StudentTestAttributes]
(
	[StudAttribId] BIGINT NOT NULL Identity(1,1) PRIMARY KEY, 
    [StudentKey] BigInt Not Null,
    [SchoolKey] INT NOT NULL, 
    [TestCenterKey] INT NOT NULL, 
    [ExternalExamKey] INT NULL, 
    [SchoolCode] VARCHAR(40) NULL, 
    [ClientCode] VARCHAR(12) NULL, 
    [ExamCode] VARCHAR(15) NULL, 
    [PortionCode] VARCHAR(15) NULL, 
    [GraduationDate] DATE NULL, 
    [ApplicationType] VARCHAR(6) NULL, 
    [SchoolName] VARCHAR(100) NULL, 
    [AdminGroup] VARCHAR(10) NULL, 
    [TimeSched] VARCHAR(8) NULL, 
    [DateSched] DATE NULL, 
    [ExternalApplicantKey] VARCHAR(25) NULL, 
    [AspenApplicantKey] VARCHAR(12) NULL, 
    [ExamDescription] VARCHAR(200) NULL, 
    [AspenSchedID] VARCHAR(12) NULL, 
    [DeliveryMethod] VARCHAR(8) NULL, 
    [ExternalTestCenterKey] VARCHAR(15) NULL, 
    [FormKey] INT NULL, 
    [ExternalSchoolKey] NCHAR(10) NULL, 
    [BookingCode] VARCHAR(50) NULL, 
    [Client] VARCHAR(120) NULL, 
    [ADAMultiplier] DECIMAL(10, 4) NULL, 
    [ADAEnable] CHAR NULL, 
    [OrigExamPortionID] VARCHAR(20) NULL, 
    [NationStateCd] NCHAR(10) NULL, 
    [ComboEnable] CHAR NULL, 
    [HistoryEnable] CHAR NULL, 
    [Licsense] VARCHAR(40) NULL, 
    [Degree] VARCHAR(50) NULL, 
    [NationStatePFA] CHAR NULL, 
    [DeploymentEnable] VARCHAR(10) NULL, 
    [EndEligiblityDate] DATE NULL, 
    [ResponsibleEmp] VARCHAR(30) NULL
)

GO

CREATE INDEX [IX_StudentTestAttributes_StudentKey] ON [dbo].[StudentTestAttributes] ([StudentKey])
