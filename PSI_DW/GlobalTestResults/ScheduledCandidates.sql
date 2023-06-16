CREATE TABLE [GlobalTestResults].[ScheduledCandidates](
	[ScheduledCandidateId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[DWCandidateKey] [bigint] NOT NULL,
	[TestScheduleKey] [bigint] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[RawScore] [int] NOT NULL,
	[PassFail] [bit] NOT NULL,
	[Reapplicant] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduledCandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [GlobalTestResults].[ScheduledCandidates] ADD  DEFAULT (getdate()) FOR [LoadDate]