﻿CREATE TABLE [Cisco].[Surveys](
	[SurveysID] [bigint] IDENTITY(1,1) NOT NULL,
	[SurveyName] [varchar](35) NULL,
 CONSTRAINT [PKSurveysID] PRIMARY KEY CLUSTERED 
(
	[SurveysID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]