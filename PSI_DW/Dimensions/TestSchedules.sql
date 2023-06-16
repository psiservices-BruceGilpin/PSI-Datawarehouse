CREATE TABLE [Dimensions].[TestSchedules](
	[TestScheduleId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceTestScheduleID] [uniqueidentifier] NOT NULL,
	[TestScheduleDBId] [bigint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[TestPackageKey] [int] NULL,
	[TestScheduleTitle] [varchar](100) NOT NULL,
	[TestScheduleDesc] [varchar](2000) NULL,
	[WebTitle] [varchar](200) NULL,
	[ScheduleStart] [datetime] NULL,
	[ScheduleEnd] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[Preview] [bit] NOT NULL,
	[ToStudent] [bit] NOT NULL,
	[ToInstructor] [bit] NOT NULL,
	[ToNotify] [bit] NOT NULL,
	[CaptureImage] [bit] NOT NULL,
	[CaptureBiometric] [bit] NOT NULL,
	[DisplayImage] [bit] NOT NULL,
	[LoginTimeLimit] [int] NOT NULL,
	[Logoff] [bit] NOT NULL,
	[AltLogoff] [bit] NOT NULL,
	[ToAdditonal] [int] NOT NULL,
	[Class] [int] NOT NULL,
	[Locked] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[RedirectToExit] [bit] NOT NULL,
	[Culture] [varchar](50) NULL,
	[CheckSum] [bigint] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TestScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[TestSchedules] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
CREATE NONCLUSTERED INDEX [IX_TestSchedules_TestScheduldDBOD] ON [Dimensions].[TestSchedules]
(
	[TestScheduleDBId] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestSchedules_TestScheduleTitle] ON [Dimensions].[TestSchedules]
(
	[TestScheduleTitle] ASC
)
INCLUDE([TestScheduleDBId]) 
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]