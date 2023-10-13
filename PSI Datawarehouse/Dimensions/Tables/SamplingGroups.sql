CREATE TABLE [Dimensions].[SamplingGroups]
(
	[SamplingGroupId] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [SamplingGroupDBID] INT NULL, 
    [CurrentFlag] BIT NOT NULL DEFAULT 0, 
    [CreatedDate] DATETIME NOT NULL DEFAULT getdate(), 
    [Checksum] BIGINT NOT NULL, 
    [SourceSystemKey] UNIQUEIDENTIFIER NOT NULL, 
    [SampleGroupName] VARCHAR(100) NOT NULL, 
    [DateAdded] DATETIME NOT NULL, 
    [IsScored] BIT NOT NULL, 
    [CastCount] INT NOT NULL
)
