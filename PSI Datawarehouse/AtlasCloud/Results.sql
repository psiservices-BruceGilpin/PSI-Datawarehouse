CREATE TABLE [AtlasCloud].[Results]
(
	[ResultsId] INT NOT NULL Identity(1,1)PRIMARY KEY, 
    [SourceResultID] INT NOT NULL, 
    [CandidateKey] INT NOT NULL, 
    [ResourceKey] INT NOT NULL, 
    [FormName] VARCHAR(255) NULL, 
    [Status] SMALLINT NULL, 
    [duration] INT NULL, 
    [DurationText] TIME NULL, 
    [Score] INT NULL, 
    [points] INT NULL, 
    [CutoffPercent] DECIMAL(7, 2) NULL, 
    [CutoffPoints] INT NULL, 
    [TimeLimit] INT NULL, 
    [Grade] SMALLINT NULL, 
    [GradeLabel] VARCHAR(100) NULL, 
    [CurrentFlag] BIT NOT NULL DEFAULT 0, 
    [ResultDBID] INT NULL, 
    [Checksum] BIGINT NOT NULL,

)
