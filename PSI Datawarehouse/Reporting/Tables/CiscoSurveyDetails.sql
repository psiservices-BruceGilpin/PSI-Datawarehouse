CREATE TABLE [Reporting].[CiscoSurveyDetails] (
    [CiscoSurveyDetailsID] BIGINT     IDENTITY (1, 1) NOT NULL,
    [Date]                 DATE       NULL,
    [AgentsKey]            INT        NULL,
    [SurveysKey]           BIGINT     NULL,
    [CallsHandled]         INT        NULL,
    [CallerDisconnected]   INT        NULL,
    [AgentDisconnected]    INT        NULL,
    [TotalSurveysAnswered] INT        NULL,
    [Avg]                  FLOAT (53) NULL,
    [ScoreOne]             INT        NULL,
    [ScoreTwo]             INT        NULL,
    [ScoreThree]           INT        NULL,
    [ScoreFour]            INT        NULL,
    [ScoreFive]            INT        NULL,
    [RunID]                INT        NULL,
    [RunDate]              DATETIME   NULL,
    [CheckSum]             INT        NULL,
    CONSTRAINT [PKCiscoSurveyDetailsID] PRIMARY KEY NONCLUSTERED ([CiscoSurveyDetailsID] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_CiscoSurveyDetails]
    ON [Reporting].[CiscoSurveyDetails]([Date] ASC, [AgentsKey] ASC, [SurveysKey] ASC);

