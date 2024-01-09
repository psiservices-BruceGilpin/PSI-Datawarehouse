CREATE TABLE [Account].[AccountSchool] (
    [AccountSchoolId]        INT           IDENTITY (1, 1) NOT NULL,
    [SourceAccountSchoolKey] VARCHAR (20)  NOT NULL,
    [SourceSystemKey]        INT           NOT NULL,
    [AccountKey]             INT           NOT NULL,
    [SchoolCode]             VARCHAR (20)  DEFAULT (' ') NOT NULL,
    [SchoolName]             VARCHAR (100) NOT NULL,
    [Description]            VARCHAR (255) NULL,
    [City]                   VARCHAR (30)  NULL,
    [State]                  VARCHAR (2)   NULL,
    [Status]                 TINYINT       NOT NULL,
    [Checksum]               INT           NOT NULL,
    [CreatedDate]            DATETIME      DEFAULT (getdate()) NOT NULL,
    [CurrentFlag]            BIT           DEFAULT ((0)) NOT NULL,
    [RunID]                  INT           NOT NULL,
    [AccountSchoolDBId]      INT           NULL,
    PRIMARY KEY CLUSTERED ([AccountSchoolId] ASC),
    CONSTRAINT [FK_AccountSchool_Account] FOREIGN KEY ([AccountKey]) REFERENCES [Account].[Accounts] ([AccountId])
);


GO
CREATE NONCLUSTERED INDEX [IX_AccountSchool_SourceAccountSchoolKey]
    ON [Account].[AccountSchool]([SourceAccountSchoolKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AccountSchool_AccountSchoolDBID]
    ON [Account].[AccountSchool]([AccountSchoolDBId] ASC) WHERE ([CurrentFlag]=(0));

