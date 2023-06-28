CREATE TABLE [Candidate].[Demographics]
(
	[DemographicId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [SourceSystemKey] INT NOT NULL, 
    [CreateDate] DATETIME NOT NULL DEFAULT getdate(), 
    [CandidateKey] BIGINT NOT NULL, 
    [DemographicTypeKey] SMALLINT NOT NULL, 
    [DemographicValue] VARCHAR(100) NOT NULL
)
