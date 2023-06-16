CREATE TABLE [Cisco].[User](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemUserKey] [int] NULL,
	[SourceSystemKey] [int] NULL,
	[FirstName] [varchar](124) NULL,
	[LastName] [varchar](124) NULL,
	[UserName] [varchar](255) NULL,
	[ScreenName] [varchar](50) NULL,
	[ManagerID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[IsDeleted] [varchar](1) NULL,
	[UserState] [smallint] NULL,
	[IsSysUser] [smallint] NULL,
	[IsMutable] [smallint] NULL,
	[IsExternalAssignment] [varchar](1) NULL,
	[LoginIP] [varchar](25) NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[CheckSum] [int] NULL,
	[EffectiveTo] [datetime] NULL,
 CONSTRAINT [PKUserID] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[User] ADD  CONSTRAINT [dfEffectiveToUser]  DEFAULT ('2099/12/31') FOR [EffectiveTo]
GO
CREATE NONCLUSTERED INDEX [IX_User_SourceSystemUserKey] ON [Cisco].[User]
(
	[SourceSystemUserKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]