CREATE TABLE [Bridge].[TestSessionStep](
	[TestSessionStepId] [bigint] IDENTITY(1,1) NOT NULL,
	[TestSessionKey] [bigint] NOT NULL,
	[StepKey] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[StepOrder] [int] NULL,
	[Enddate] [date] NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[Duration] [decimal](10, 2) NULL,
	[StepTimeStamp] [datetime] NULL,
	[RunDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TestSessionStepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Bridge].[TestSessionStep]  WITH CHECK ADD  CONSTRAINT [FK_TestSessionStep_Test] FOREIGN KEY([TestSessionKey])
REFERENCES [Bridge].[TestSession] ([TestSessionId])
GO

ALTER TABLE [Bridge].[TestSessionStep] CHECK CONSTRAINT [FK_TestSessionStep_Test]
GO
ALTER TABLE [Bridge].[TestSessionStep] ADD  DEFAULT (getdate()) FOR [RunDate]
GO
CREATE NONCLUSTERED INDEX [IX_TestSessionStep_TestDate] ON [Bridge].[TestSessionStep]
(
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestSessionStep_TestSessionKey] ON [Bridge].[TestSessionStep]
(
	[TestSessionKey] ASC
)
INCLUDE([StepKey],[StartDate],[StartTime],[StepOrder],[EndTime],[Duration]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestSessionStep_TestStartDate] ON [Bridge].[TestSessionStep]
(
	[StepKey] ASC
)
INCLUDE([TestSessionKey],[StartDate],[StartTime],[StepOrder],[Enddate],[Duration]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]