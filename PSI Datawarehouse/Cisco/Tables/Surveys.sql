CREATE TABLE [Cisco].[Surveys] (
    [SurveysID]  BIGINT       IDENTITY (1, 1) NOT NULL,
    [SurveyName] VARCHAR (35) NULL,
    CONSTRAINT [PKSurveysID] PRIMARY KEY CLUSTERED ([SurveysID] ASC)
);

