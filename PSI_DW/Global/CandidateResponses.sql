CREATE TABLE [Global].[CandidateResponses]
(
	[CandidateResponseId] INT NOT NULL PRIMARY KEY, 
    [DWSourceTable] VARCHAR(50) NOT NULL, 
    [DWSourceKey] BIGINT NOT NULL, 
    [CurrentFlag] BIT NOT NULL DEFAULT 0, 
    [CreateDate] DATETIME NOT NULL DEFAULT getdate(), 
    [Checksum] BIGINT NOT NULL, 
    [DWSourceQuestionKey] BIGINT NOT NULL, 
    [DWSourceResponseKey] BIGINT NOT NULL, 
    [DWTestSectionKey] BIGINT NOT NULL, 
    [Correct] BIGINT NULL
)
