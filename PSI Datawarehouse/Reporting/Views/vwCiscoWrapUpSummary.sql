/*************************************************************
CREATED BY: William Davis
CREATED ON: 6/22/2022
DESC:
	Displays Cisco Wrapup Summary by Date,Agent,Calltype,PrecisionQueue, and WrapupData
EDITS:

Query Based On [UCCEReporting].sp_getWrapUpDataSummaryByPeriod

Validated Against Wrap Up Summary Report
******************************************************************/
CREATE VIEW
	[Reporting].[vwCiscoWrapUpSummary]
AS
SELECT 
	 [Date]
	,b.AgentTeam
	,b.FullName AS Agent
	,e.WrapUpData,
	COUNT(DISTINCT CAST(RouterCallKey AS VARCHAR) + '[_]' +  CAST(RouterCallKeyDay AS VARCHAR)) AS TotalACDCalls, 
	CONVERT(VARCHAR, DATEADD(second,SUM(talktime + holdtime + worktime),0),108) AS TotalHandle, 
	CONVERT(VARCHAR, DATEADD(second,AVG(talktime + holdtime + worktime),0),108) AS AvgHandle, 
	CONVERT(VARCHAR, DATEADD(second,MIN((talktime + holdtime + worktime)) ,0),108)  AS MinHandle,
	CONVERT(VARCHAR, DATEADD(second,MAX((talktime + holdtime + worktime)),0),108) AS MaxHandle, 
	CONVERT(VARCHAR, DATEADD(second,SUM(talktime),0),108) AS TotalTalk, 
	CONVERT(VARCHAR, DATEADD(second,AVG(talktime),0),108) AS AvgTalk, 
	CONVERT(VARCHAR, DATEADD(second,MIN(talktime),0),108) AS MinTalk,
	CONVERT(VARCHAR, DATEADD(second,MAX(talktime),0),108) AS MaxTalk

FROM 
	[Reporting].[CiscoWrapUpDetail] a
INNER JOIN
	[Cisco].[Agents] b
ON
	a.AgentsKey = b.AgentsID
INNER JOIN
	[Cisco].[CallType] c
ON
	a.CallTypeKey = c.CallTypeID
INNER JOIN
	[Cisco].[PrecisionQueue] d
ON
	a.PrecisionQueueKey = d.PrecisionQueueID
INNER JOIN
	[Cisco].[WrapUpData] e
ON
	a.WrapUpDataKey = e.WrapUpDataID
GROUP BY
	 [Date]
	,b.AgentTeam
	,b.FullName  
	,e.WrapUpData

 
