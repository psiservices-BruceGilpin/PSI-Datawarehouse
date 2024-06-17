CREATE TABLE [AtlasCloud].[Schools]
(
	[SchoolId] INT NOT NULL Identity(1,1) PRIMARY KEY,
    [FirstName]    varchar(100),
    [LastName]      varchar(100),
    [Street]        varchar(250),
    [City]          varchar(100),
    [State]         varchar(100),
    [Country]       varchar(100),
    [Email]         varchar(100),
    [LanguageKey]   smallint,
	[SourceSystemKey] SMALLINT NOT NULL, 
    [SchoolDBID] INT NULL, 
    [Currentflag] BIT NOT NULL DEFAULT 0, 
    [CheckSum] BIGINT NOT NULL, 
    [ActorID]   Bigint Not Null,
    [Path]      varchar(250) not null, 
    [LoadDate] DATETIME NOT NULL DEFAULT getdate(),
    [CreatedDate] Datetime Not Null,
    [ModifiedDate] Datetime Null,
    [RemovedDate] Datetime Null
)
