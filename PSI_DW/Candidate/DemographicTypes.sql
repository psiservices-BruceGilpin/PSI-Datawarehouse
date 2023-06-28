CREATE TABLE [Candidate].[DemographicTypes]
(
	[DemoGraphicTypeId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [Demographic] VARCHAR(50) NOT NULL, 
    [SourceAddributeID] Int Not Null,
    [CreateDate] DATETIME NOT NULL DEFAULT GetDate()
)
