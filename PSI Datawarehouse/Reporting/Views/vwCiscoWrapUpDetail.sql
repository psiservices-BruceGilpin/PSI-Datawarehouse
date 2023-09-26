
/*************************************************************
CREATED BY: William Davis
CREATED ON: 6/22/2022
DESC:
	Displays Cisco Wrapup Detail by Date,Agent,Calltype,PrecisionQueue, and WrapupData
EDITS:

Query Based On [UCCEReporting].sp_getWrapUpDataDetail

Validated Against Wrap Up Detail Report
******************************************************************/
CREATE VIEW
	[Reporting].[vwCiscoWrapUpDetail]
AS
SELECT 
	 [Date]
	,b.AgentTeam
	,b.FullName AS Agent
	,b.LoginName
	,[Extension]
	,[DayID-CallID-SeqNo]
	,CONCAT([CallStartDate],' ',LEFT([CallStartTime],12)) AS [CallStartTime]
	,CONCAT([CallEndDate],' ',LEFT([CallEndTime],12)) AS [CallEndTime]
	,[CallANI]
	,[CalledNumber]
	,c.EnterpriseName AS CallType
	,d.EnterpriseName AS PQ
	,CONVERT(VARCHAR, DATEADD(second,[TalkTime],0),108) [TalkTime]
	,CONVERT(VARCHAR, DATEADD(second,[HoldTime],0),108) [HoldTime]
	,CONVERT(VARCHAR, DATEADD(second,[WorkTime],0),108) [WorkTime]
	,e.WrapUpData
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
 
