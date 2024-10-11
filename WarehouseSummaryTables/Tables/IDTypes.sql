CREATE TABLE [Candidates].[IDTypes]
(
	[CandidateTypeId] INT NOT NULL identity(1,1) PRIMARY KEY, 
    [SourceSystemkey] SMALLINT NOT NULL, 
    [CandidateIDType] VARCHAR(50) NOT NULL, 
    [LoadDate] DATETIME NOT NULL DEFAULT getdate()
)
