
/*************************************************************
CREATED BY: William Davis
CREATED ON: 5/23/2022
DESC:
	Displays Cisco Number of Calls by Call Type Queue  Summerized by Date 
EDITS:

Based On [UCCEReporting].[dbo].[sp_getOneTimeCallReport] 
******************************************************************/
CREATE VIEW
	[Reporting].[vwCiscoCallTypeQueueSummary]
AS
SELECT  
	 [Date]
	,[TimeZone]
	,[CallQueue] AS LastQueueReached
	,[TotalCalls]
	,[1Call]
	,[2Calls]
	,[3Calls]
	,[4Calls]
	,[5Calls]
	,[6Calls]
	,[7Calls]
	,[8Calls]
	,[9Calls]
	,[10-14Calls]
	,[15-19Calls]
	,[20-24Calls]
	,[25-29Calls]
	,[30-39Calls]
	,[40-49Calls]
	,[50-99Calls]
	,[100+Calls]
FROM 
	[Reporting].[CiscoCallTypeQueueSummary] a
INNER JOIN
	[Cisco].[CallTypeQueue] b
ON
	a.CallTypeQueueKey = b.CallTypeQueueID
