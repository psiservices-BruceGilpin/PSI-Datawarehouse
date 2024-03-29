﻿CREATE TABLE [Candidate].[Demographics]
(
	[DemographicId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [SourceSystemKey] INT NOT NULL, 
    [CreateDate] DATETIME NOT NULL DEFAULT getdate(), 
    [DemographicTypeKey] SMALLINT NOT NULL, 
    [DemographicValue] VARCHAR(255) NOT NULL
)

GO

CREATE INDEX [IX_Demographics_DemographicValue] ON [Candidate].[Demographics] ( [DemographicValue])
