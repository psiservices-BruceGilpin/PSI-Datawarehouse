CREATE TABLE [AtlasCloud].[ResultItem]
(
	[ResultItemId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [SourceResultID] INT NOT NULL, 
    [ItemKey] INT NOT NULL, 
    [Sequence] SMALLINT NOT NULL, 
    [Answered] BIT NOT NULL, 
    [Correct] BIT NOT NULL, 
    [Points] INT NOT NULL, 
    [Category] VARCHAR(10) NOT NULL, 
    [Duration] INT NOT NULL, 
    [Visited] BIT NOT NULL, 
    [DataServerKey] INT NOT NULL, 
    [InsertedDate] DATETIME NULL, 
    [UpdatedDate] DATETIME NULL
)
