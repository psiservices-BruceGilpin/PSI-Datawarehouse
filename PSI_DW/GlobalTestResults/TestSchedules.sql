CREATE TABLE [GlobalTestResults].[TestSchedules](
	[GlobalTestScheduleId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[ClientCode] [varchar](20) NOT NULL,
	[ExamID] [varchar](20) NOT NULL,
	[ExamPortion] [varchar](20) NOT NULL,
	[FormName] [varchar](20) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[TestCenterID] [varchar](20) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GlobalTestScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [GlobalTestResults].[TestSchedules] ADD  DEFAULT (getdate()) FOR [LoadDate]