CREATE TABLE [Nice].[Caller]
(
	[CallerID] INT NOT NULL Identity(1,1) PRIMARY KEY, 
    [FirstName] VARCHAR(254) NULL, 
    [LastName] VARCHAR(254) NULL, 
    [ContactKey] BIGINT NOT NULL
)
