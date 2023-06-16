CREATE TABLE [Aspen].[DemographicKeys](
	[DemoKeyId] [int] IDENTITY(1,1) NOT NULL,
	[DemoKeyDBId] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[QuestionKey] [int] NOT NULL,
	[AnswerCode] [varchar](5) NOT NULL,
	[AnswerDescription] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DemoKeyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Aspen].[DemographicKeys] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Aspen].[DemographicKeys] ADD  DEFAULT (getdate()) FOR [CreateDate]