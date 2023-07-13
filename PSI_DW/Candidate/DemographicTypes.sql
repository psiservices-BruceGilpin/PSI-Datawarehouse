CREATE TABLE [Candidate].[DemographicTypes]
(
	[DemoGraphicTypeId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [Demographic] VARCHAR(50) NOT NULL, 
    [SourceAttributeID] Int Not Null,
    [CreateDate] DATETIME NOT NULL DEFAULT GetDate(), 
    [ClientKey] INT NOT NULL DEFAULT 0, 
    [DemographicTypeDBId] INT NOT NULL, 
    [CandidateColumnName] VARCHAR(40) NULL
)
