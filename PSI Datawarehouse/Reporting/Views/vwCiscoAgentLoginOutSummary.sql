


/*************************************************************
CREATED BY: William Davis
CREATED ON: 6/16/2022
DESC:
	Displays Cisco Agent Login and Out Information
EDITS:

Based On Query from the Cisco Phone System LoginLogOut Report 

Validated Against LoginLogout Report
******************************************************************/
CREATE VIEW
	[Reporting].[vwCiscoAgentLoginOutSummary]
AS
SELECT   
	 [Date]
	,b.FullName AS Agent
	,b.PeripheralNumber AS Ext
	,b.AgentTeam
	,CAST(CONCAT([LoginDate],' ',LEFT([LoginTime],12)) AS DATETIME) AS LoginTime
	,CAST(CONCAT([LogoutDate],' ',LEFT([LogoutTime],12)) AS DATETIME) AS LogoutTime
	,CONVERT(VARCHAR, DATEADD(second,[Duration],0),108) AS [Duration]
FROM 
	[Reporting].[CiscoAgentLoginOutSummary] a
INNER JOIN
	[Cisco].[Agents] b
ON
	a.AgentsKey = b.AgentsID
