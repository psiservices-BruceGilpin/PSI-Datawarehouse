



/*************************************************************
CREATED BY: William Davis
CREATED ON: 5/23/2022
DESC:
	Displays Cisco EntryPoint Date Summerized by Date and Entrypoint
EDITS:

Query Based On [UCCEReporting].[dbo].[sp_getChatEntryPointSummaryByPeriod] 

Validated Against Chat Summary Report
******************************************************************/
CREATE VIEW
	[Reporting].[vwCiscoEntryPointSummary]
AS
SELECT 
	 [Date]
	,[EntryPointName]
	,[OfferedChats]
	,[ServicedChats] AS HandledChats
	,[AbandonedChats]
	,[ServicedChattingTime]
	,[ServicedWrapUPTime]
	,[WrapUpChats]
	,[ServicedChatDurationTime]
	,[ServicedWaitTime]
	,[TotalAbandonedTime]
	,CONVERT(VARCHAR, DATEADD(second,[ServicedChattingTime],0),108) AS ChattingTime
	,CONVERT(VARCHAR, DATEADD(second,ISNULL(NULLIF([ServicedWaitTime],0) / NULLIF([ServicedChats],0),0),0),108) AS ASA
FROM 
	[Reporting].[CiscoEntryPointSummary] a
INNER JOIN
	[Cisco].[EntryPoint] b
ON
	a.EntryPointKey = b.EntryPointID
