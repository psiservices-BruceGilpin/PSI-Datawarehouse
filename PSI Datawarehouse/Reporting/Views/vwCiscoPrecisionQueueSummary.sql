/*************************************************************
CREATED BY: William Davis
CREATED ON: 5/23/2022
DESC:
	Displays Cisco KPIs  Precision Type Queue  Summerized by Date 
EDITS:

Query Based on sp_getPQByPeriod

Validated Against Precision Queue Summary Report
******************************************************************/
CREATE VIEW
	[Reporting].[vwCiscoPrecisionQueueSummary]
AS
SELECT 
	 [Date]
	,b.EnterpriseName AS PQ
	,[TotalComplete] AS Offered
	,[CallsHandled] AS Handled
	,[CallsAnswered] AS Answered
	,[AbandCalls] AS Abandoned
	,[RedirectNoAnsCalls] AS RONA
	,[RouterError] AS ErrorCalls
	,[TransferInCalls] AS TransferIn
	,[TransferOutCalls] AS TransferOut
	,CONVERT(VARCHAR, DATEADD(second,NULLIF([AnswerWaitTime],0)/NULLIF([CallsAnswered],0),0),108) AS ASA
	,CONVERT(VARCHAR, DATEADD(second,NULLIF([AbandonTime],0)/NULLIF([AbandCalls],0),0),108) AS AvgAbandonDelay
	,CONVERT(VARCHAR, DATEADD(second,[TotalHandleTime],0),108) AS HandleTime
	,CONVERT(VARCHAR, DATEADD(second,NULLIF([TotalHandleTime],0)/NULLIF([CallsHandled],0),0),108) AS AvgHandleTime
	,CONVERT(VARCHAR, DATEADD(second,[MaxCallWaitTime],0),108) AS [MaxCallWaitTime]
	,[MaxCallsQueued]
	,[ServicelLevelTop]
	,[ServicelLevelBottom]
FROM 
	[Reporting].[CiscoPrecisionQueueSummary] a
INNER JOIN
	[Cisco].[PrecisionQueue] b
ON
	a.PrecisionQueueKey = b.PrecisionQueueID

