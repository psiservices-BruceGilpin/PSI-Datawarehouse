CREATE TABLE [Candidate].[DemographicCodes]
(
	[DemoGrapichCodeId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [DemographicTypeKey] INT NOT NULL, 
    [DemographicValue] VARCHAR(40) NOT NULL, 
    [CreateDate] DATETIME NOT NULL DEFAULT getdate()
)
