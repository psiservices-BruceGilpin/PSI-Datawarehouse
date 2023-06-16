CREATE TABLE [Reporting].[CiscoSurveyDetails](
	[CiscoSurveyDetailsID] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[AgentsKey] [int] NULL,
	[SurveysKey] [bigint] NULL,
	[CallsHandled] [int] NULL,
	[CallerDisconnected] [int] NULL,
	[AgentDisconnected] [int] NULL,
	[TotalSurveysAnswered] [int] NULL,
	[Avg] [float] NULL,
	[ScoreOne] [int] NULL,
	[ScoreTwo] [int] NULL,
	[ScoreThree] [int] NULL,
	[ScoreFour] [int] NULL,
	[ScoreFive] [int] NULL,
	[RunID] [int] NULL,
	[RunDate] [datetime] NULL,
	[CheckSum] [int] NULL,
 CONSTRAINT [PKCiscoSurveyDetailsID] PRIMARY KEY NONCLUSTERED 
(
	[CiscoSurveyDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [CX_CiscoSurveyDetails] ON [Reporting].[CiscoSurveyDetails]
(
	[Date] ASC,
	[AgentsKey] ASC,
	[SurveysKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]