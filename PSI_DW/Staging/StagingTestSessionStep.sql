CREATE TABLE [Staging].[StagingTestSessionStep](
	[SessionID] [bigint] NOT NULL,
	[StepKey] [int] NOT NULL,
	[Note] [varchar](max) NULL,
	[StartDate] [date] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[StepOrder] [int] NOT NULL,
	[EndDate] [date] NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[StepTimeStamp] [datetime] NULL,
	[Duration] [decimal](10, 2) NULL,
	[RunDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [CX_StagingTestSessionStep] ON [Staging].[StagingTestSessionStep]
(
	[SessionID] ASC,
	[StepOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]