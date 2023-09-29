/*************************************************************
CREATED BY: William Davis
CREATED ON: 6/22/2022
DESC:
	Displays Cisco Agent Stats Summerized by Date and agent
EDITS:

Query Based On [UCCEReporting].[dbo].[sp_getAgentStatsByPeriod]

Validated Against Not Ready Summary Report
******************************************************************/
CREATE VIEW
	[Reporting].[vwCiscoAgentNotReadySummaryStats]
AS

SELECT 
	 [Date]
	,b.AgentTeam
	,b.FullName AS Agent
	,CONVERT(VARCHAR, DATEADD(second,NULLIF([HandledCallsTime],0)/NULLIF([CallsHandled],0),0),108) AS AHT
	,CONVERT(VARCHAR, DATEADD(second,[AgentLoggedOnTime],0),108) AS [AgentLoggedOnTime]	
	,CONVERT(VARCHAR, DATEADD(second,[TotalNotReady],0),108) AS [TotalNotReady]
	,CONVERT(VARCHAR, DATEADD(second,(([AgentLoggedOnTime]) - [TotalNotReady] -[TalkTime] -[WrapTime] -[HoldTime]),0),108) AS TotalReady
	,CONVERT(VARCHAR, DATEADD(second,[Break],0),108) AS [Break]
	,CONVERT(VARCHAR, DATEADD(second,[Meeting/Training],0),108) AS [Meeting/Training]
	,CONVERT(VARCHAR, DATEADD(second,[Lunch],0),108) AS [Lunch]
	,CONVERT(VARCHAR, DATEADD(second,[Personal],0),108) AS [Personal]
	,CONVERT(VARCHAR, DATEADD(second,[FollowUpWork],0),108) AS [FollowUpWork]
	,CONVERT(VARCHAR, DATEADD(second,[Voicemail],0),108) AS [Voicemail]
	,CONVERT(VARCHAR, DATEADD(second,[Email],0),108) AS [Email]
	,CONVERT(VARCHAR, DATEADD(second,[Login/NoCode],0),108) AS [Login/NoCode]
	,CONVERT(VARCHAR, DATEADD(second,[POCTask],0),108) AS [POCTask]
	,CONVERT(VARCHAR, DATEADD(second,[ExamAccomodations],0),108) AS [ExamAccomodations]
	,CONVERT(VARCHAR, DATEADD(second,[DidNotAnswerCall],0),108) AS [DidNotAnswerCall]
	,CONVERT(VARCHAR, DATEADD(second,[ManagementApproval],0),108) AS [ManagementApproval]
	,CONVERT(VARCHAR, DATEADD(second,[AssignTasks-Other],0),108) AS [AssignTasks-Other]
	,CONVERT(VARCHAR, DATEADD(second,[DisplacedCD],0),108) AS [DisplacedCD]
	,CONVERT(VARCHAR, DATEADD(second,[ACW],0),108) AS [ACW]
	,CONVERT(VARCHAR, DATEADD(second,[SocialMedia],0),108) AS [SocialMedia]
	,CONVERT(VARCHAR, DATEADD(second,[Zendesk],0),108) AS [Zendesk]
	,CONVERT(VARCHAR, DATEADD(second,[Coaching],0),108) AS [Coaching]
	,CONVERT(VARCHAR, DATEADD(second,[Tech],0),108) AS [Tech]
	,CONVERT(VARCHAR, DATEADD(second,[ClosedFinesseW/OLogoutorError],0),108) AS [ClosedFinesseW/OLogoutorError]
	,CONVERT(VARCHAR, DATEADD(second,[OutboundCalls],0),108) AS [OutboundCalls]
	,CONVERT(VARCHAR, DATEADD(second,[AgentOutCallsTime],0),108)  AS ActualOutboundCallTime
	,CONVERT(VARCHAR, DATEADD(second,[TimeInOtherRCs],0),108) AS [TimeInOtherRCs]
	,CONVERT(VARCHAR, DATEADD(second,[TotalApprovedNRTime],0),108) AS [TotalApprovedNRTime]
	,CONVERT(VARCHAR, DATEADD(second,[TotalNotApprovedNRTime],0),108) AS [TotalNotApprovedNRTime]
	,CONVERT(VARCHAR, DATEADD(second,[WrapTime],0),108) AS [WrapTime]
	,CONVERT(VARCHAR, DATEADD(second,[TalkTime],0),108) AS [TalkTime]
	,CONVERT(VARCHAR, DATEADD(second,[HoldTime],0),108) AS [HoldTime]

FROM 
	[Reporting].[CiscoAgentStats]a
INNER JOIN
	[Cisco].[Agents] b
ON
	a.AgentsKey = b.AgentsID
