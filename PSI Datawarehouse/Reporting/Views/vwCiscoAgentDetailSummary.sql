



/*************************************************************
CREATED BY: William Davis
CREATED ON: 6/15/2022
DESC:
	Displays Cisco KPIs  Precision Type Queue  Summerized by Date and agent
EDITS:

Based On Logic Found in [UCCEReporting].[dbo].[sp_getAgentAHTReportByPeriod] 

Validated Against Agent AHT Report
******************************************************************/
CREATE VIEW
	[Reporting].[vwCiscoAgentDetailSummary]
AS
SELECT 
	 a.[Date]
	,a.[TimeZone]
	,b.AgentTeam
	,b.[FullName] AS Agent
	,c.[EnterpriseName] AS PQ
	,[CallsHandled]
	,ISNULL(CONVERT(VARCHAR, DATEADD(second,NULLIF([HandledCallsTime],0)/NULLIF([CallsHandled],0),0),108),'00:00:00')  AS [HandledCallsTime]
	,ISNULL(CONVERT(VARCHAR, DATEADD(second,NULLIF(CAST([ALLPQHandleTime] AS FLOAT),0)/NULLIF(CAST([ALLPQCallsHandled] AS FLOAT),0),0),108),'00:00:00')  AS AllAgentsAHT
	,CONVERT(VARCHAR, DATEADD(second,[TalkTime],0),108) AS [TalkTime]
	,CONVERT(VARCHAR, DATEADD(second,[HoldTime],0),108) AS [HoldTime]
	,CONVERT(VARCHAR, DATEADD(second,[WrapTime],0),108) AS [WrapTime]
	,CONVERT(VARCHAR, DATEADD(second,[AvailTime],0),108) AS [AvailTime]
FROM 
	[Reporting].[CiscoAgentDetailSummary] a
INNER JOIN
	[Cisco].[Agents] b
ON
	a.AgentsKey = b.AgentsID
INNER JOIN
	[Cisco].[PrecisionQueue] c
ON
	a.PrecisionQueueKey = c.PrecisionQueueID
WHERE
	c.[EnterpriseName] IS NOT NULL

	
