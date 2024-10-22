CREATE TABLE [Staging].[AtlasLCKeys]
(
	[AtlasLCKeysId] INT NOT NULL identity(1,1) PRIMARY KEY, 
    [TestRegnID] INT NOT NULL, 
    [CandidateID] VARCHAR(25) NOT NULL, 
    [CandidateIDTypeKey] Varchar(50) NULL, 
    [TestID] INT NOT NULL, 
    [SchoolID] INT NULL, 
    [ScheduleID] INT NULL, 
    [TestDate] DATETIME NULL, 
    [TestAssignmentID] INT NOT NULL, 
    [PortionID] INT NOT NULL, 
    [AccountID] INT NOT NULL, 
    [Checksum] BIGINT NULL
)

GO
