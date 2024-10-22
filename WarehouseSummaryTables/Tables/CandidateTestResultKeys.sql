
CREATE TABLE [AtlasLC].[CandidateTestResultKeys]
(
	[TestResultDBId] INT NOT NULL Identity(1,1)  PRIMARY KEY, 
    [TestRegnID] INT NOT NULL, 
    [CandidateKey] INT NOT NULL, 
    [CandidateIDTypeKey] INT NOT NULL, 
    [TestKey] INT NOT NULL, 
    [SchoolKey] INT NULL, 
    [ScheduleKey] INT NULL, 
    [TestDate] DATETIME NULL, 
    [AccountKey] INT NOT NULL,
    [TestAssignmentKey] INT NULL, 
    [PortionKey] INT NOT NULL, 
    [loaddate] DATETIME NOT NULL DEFAULT getdate(), 
    [Checksum] BIGINT NULL
)





GO

CREATE INDEX [IX_CandidateTestResultKeys_CandidateKey] ON [AtlasLC].[CandidateTestResultKeys] ([CandidateKey])
Include (TestKey)

GO

CREATE INDEX [IX_CandidateTestResultKeys_TestKey] ON [AtlasLC].[CandidateTestResultKeys] ([TestKey])
include (CandidateKey)

GO

CREATE INDEX [IX_CandidateTestResultKeys_AccountKey] ON [AtlasLC].[CandidateTestResultKeys] ([AccountKey])
Include ([TestKey])
