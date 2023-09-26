/*************************************************************
CREATED BY: William Davis
CREATED ON: 7/6/2022
DESC:
	Displays Cisco CSR Email Data by RoutingQueue and User
EDITS:

Query Based On CSR-ECE Email Query

Validated Against CSR-ECE Email Query
******************************************************************/
CREATE VIEW
	[Reporting].[vwCiscoCSREmailDetail]
AS
SELECT 
	a.[CaseID], 
	q.QueueName, 
	u.UserName, 
	CAST(CONCAT(FirstCreatedDate,' ',LEFT(FirstCreatedTime,12)) AS DATETIME) AS FirstCreated, 
	CAST(CONCAT(FirstRepliedDate,' ',LEFT(FirstRepliedTime,12)) AS DATETIME) AS FirstReplied , 
	a.Email, 
	a.Subject,
	HourFirstReply
FROM 
	[Reporting].[CiscoCSREmailDetail] a
LEFT JOIN
	[Cisco].[RoutingQueue] q 
ON 
	a.[RoutingQueueKey] = q.[RoutingQueueId]
LEFT JOIN 
	[Cisco].[User] u 
ON 
	a.[UserKey] = u.[UserID]
