CREATE TABLE [Aspen].[Demographics](
	[DemographicId] [int] IDENTITY(1,1) NOT NULL,
	[DemographicDBID] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[ApplicationKey] [int] NOT NULL,
	[DemographicQuestionKey] [int] NOT NULL,
	[AnswerValue] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[DemographicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Aspen].[Demographics] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Aspen].[Demographics] ADD  DEFAULT (getdate()) FOR [CreateDate]