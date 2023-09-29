

/*************************************************************
CREATED BY: William Davis
CREATED ON: 5/23/2022
DESC:
	Displays Cisco Agent Stats Summerized by Date and agent
EDITS:

Query Based On [UCCEReporting].[dbo].[sp_getAgentStatsByPeriod]

Validated Against Agent Detail Summary Report
******************************************************************/
CREATE VIEW
	[Reporting].[vwCiscoAgentStats]
AS
SELECT 
	 [Date]
	,[TimeZone]
	,b.FullName AS Agent
	,b.AgentTeam
	,CONVERT(VARCHAR, DATEADD(second,[AgentLoggedOnTime],0),108) AS [AgentLoggedOnTime]	
	,[CallsHandled]
	,[RedirectCalls]
	,CONVERT(VARCHAR, DATEADD(second,NULLIF([HandledCallsTime],0)/NULLIF([CallsHandled],0),0),108) AS [AvgHandledCallsTime]
	,[InCallsOnHold]
	,CONVERT(VARCHAR, DATEADD(second,NULLIF([OnHoldTime],0)/NULLIF([InCallsOnHold],0),0),108) AS [AvgHoldTime]
	,[TransferInCalls]
	,[TransferOutCalls]
	,[OutExtnCalls]
	,CONVERT(VARCHAR, DATEADD(second,[TalkTime],0),108) AS [TalkTime]
	,CONVERT(VARCHAR, DATEADD(second,[AgentOutCallsTime],0),108) AS [AgentOutCallsTime]
	,CONVERT(VARCHAR, DATEADD(second,[AgentOutCallsTalkTime],0),108) AS[AgentOutCallsTalkTime]
	,[AgentTerminatedCalls]
	,CONVERT(VARCHAR, DATEADD(second,[HoldTime],0),108) AS [HoldTime]
	,CONVERT(VARCHAR, DATEADD(second,[WrapTime],0),108) AS [WrapTime]
	,CONVERT(VARCHAR, DATEADD(second,[AvailTime],0),108) AS [AvailTime] 
	,CONVERT(VARCHAR, DATEADD(second,[TotalNotReady],0),108) AS [TotalNotReady]
	,CONVERT(VARCHAR, DATEADD(second,[OnHoldTime],0),108) AS [OnHoldTime]
	,CONVERT(VARCHAR, DATEADD(second,[TotalNotReady],0),108) AS [NotReadyTime]
	,CONVERT(VARCHAR, DATEADD(second,[TotalApprovedNRTime],0),108) AS [TotalApprovedNRTime]
	,CONVERT(VARCHAR, DATEADD(second,[TotalNotApprovedNRTime],0),108) AS [TotalNotApprovedNRTime]
FROM 
	[Reporting].[CiscoAgentStats] a
INNER JOIN
	[Cisco].[Agents] b
ON
	a.AgentsKey = b.AgentsID








