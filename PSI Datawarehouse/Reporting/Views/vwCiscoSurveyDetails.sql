/*************************************************************
CREATED BY: William Davis
CREATED ON: 6/23/2022
DESC:
	Displays Cisco Survey KPIs by Date, Agent, and Survey
EDITS:

Query Based on [UCCEReporting].[dbo].[sp_getSurveyResultsByAgent]

Validated Against Survey Results Report
******************************************************************/
CREATE VIEW
	[Reporting].[vwCiscoSurveyDetails]
AS
SELECT 
	 [Date]
	,b.FullName AS Agent
	,c.SurveyName AS Survey
	,[CallsHandled]
	,[CallerDisconnected]
	,[AgentDisconnected]
	,[TotalSurveysAnswered]
	,[Avg]
	,[ScoreOne]
	,[ScoreTwo]
	,[ScoreThree]
	,[ScoreFour]
	,[ScoreFive]
FROM 
	[Reporting].[CiscoSurveyDetails] a
INNER JOIN
	[Cisco].[Agents] b
ON
	a.agentsKey = b.AgentsID
INNER JOIN
	[Cisco].[Surveys] c
ON
	a.SurveysKey = c.SurveysID

