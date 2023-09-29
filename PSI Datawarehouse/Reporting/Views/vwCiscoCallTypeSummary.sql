

/*************************************************************
CREATED BY: William Davis
CREATED ON: 6/17/2022
DESC:
	Displays Cisco Call Type KPIs Summerized by Date and Call Type
EDITS:

Query Based On [UCCEReporting].[dbo].[sp_getCallTypeSummaryByPeriod] 

Validated Against CallType Summary Report
******************************************************************/
CREATE VIEW
	[Reporting].[vwCiscoCallTypeSummary]
AS
SELECT 
	 [Date]
	,[EnterpriseName] AS CT
	,[TimeZone]
	,[CallsOffered]
	,[CallsHandled]
	,[TotalCallsAband]
	,CAST([RONA] AS INT) AS [RONA]
	,[IncompleteCalls]
	,[OverflowOut]
	,ISNULL(CONVERT(VARCHAR, DATEADD(second,NULLIF([AnswerWaitTime],0)/NULLIF([CallAnswered],0),0),108),'00:00:00')  AS ASA
	,ISNULL(CONVERT(VARCHAR, DATEADD(second,NULLIF([CallDelayAbandTime],0)/NULLIF([TotalCallsAband],0),0),108),'00:00:00')  AS AvgAbandonDely
	,ISNULL(CONVERT(VARCHAR, DATEADD(second,[HandleTime],0),108),'00:00:00') AS [HandleTime]
	,ISNULL(CONVERT(VARCHAR, DATEADD(second,NULLIF([HandleTime],0)/NULLIF([CallsHandled],0),0),108),'00:00:00')  AS AvgHandleTime
	,NULLIF([ServicelLevelNum],0)/NULLIF([ServicelLevelDeNom],0) AS ServiceLevel
	,NULLIF([ServicelLevelNum],0)/NULLIF(([ServicelLevelDeNom]-[ServiceLevelError]),0) AS ServiceLevelWOError
	,ISNULL(CONVERT(VARCHAR, DATEADD(second,[MaxCallWaitTime],0),108),'00:00:00') AS [MaxCallWaitTime]
	,ISNULL(CONVERT(VARCHAR, DATEADD(second,[MinQueueTime],0),108),'00:00:00') AS [MinQueueTime]
FROM 
	[Reporting].[CiscoCallTypeSummary] a
INNER JOIN
	[Cisco].[CallType] b
ON
	a.[CallTypeKey] = b.[CallTypeID]
