CREATE TABLE [Cisco].[User] (
    [UserID]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [SourceSystemUserKey]  INT           NULL,
    [SourceSystemKey]      INT           NULL,
    [FirstName]            VARCHAR (124) NULL,
    [LastName]             VARCHAR (124) NULL,
    [UserName]             VARCHAR (255) NULL,
    [ScreenName]           VARCHAR (50)  NULL,
    [ManagerID]            INT           NULL,
    [CreatedDate]          DATETIME      NULL,
    [IsDeleted]            VARCHAR (1)   NULL,
    [UserState]            SMALLINT      NULL,
    [IsSysUser]            SMALLINT      NULL,
    [IsMutable]            SMALLINT      NULL,
    [IsExternalAssignment] VARCHAR (1)   NULL,
    [LoginIP]              VARCHAR (25)  NULL,
    [RunID]                INT           NULL,
    [EffectiveFrom]        DATETIME      NULL,
    [CheckSum]             INT           NULL,
    [EffectiveTo]          DATETIME      CONSTRAINT [dfEffectiveToUser] DEFAULT ('2099/12/31') NULL,
    CONSTRAINT [PKUserID] PRIMARY KEY CLUSTERED ([UserID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_User_SourceSystemUserKey]
    ON [Cisco].[User]([SourceSystemUserKey] ASC);

