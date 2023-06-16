CREATE TABLE [Aspen].[DemographicDefinitions](
	[DemographicId] [int] IDENTITY(1,1) NOT NULL,
	[DemographicDBID] [int] NOT NULL,
	[Currentflag] [bit] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[SourceSystemkey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[ExamKey] [int] NOT NULL,
	[BeginingEffectiveDate] [date] NOT NULL,
	[EndEffectiveDate] [date] NOT NULL,
	[Question] [varchar](200) NULL,
	[QuestionType] [varchar](10) NULL,
	[QuestionNumber] [smallint] NULL,
	[NumberOfResponses] [smallint] NULL,
	[ResponseType] [char](1) NULL,
	[Required] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[DemographicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Aspen].[DemographicDefinitions] ADD  DEFAULT ((0)) FOR [Currentflag]
GO
ALTER TABLE [Aspen].[DemographicDefinitions] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
CREATE NONCLUSTERED INDEX [IX_DemographicDefinitions_CurrentFlag] ON [Aspen].[DemographicDefinitions]
(
	[Currentflag] ASC
)
INCLUDE([DemographicDBID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]