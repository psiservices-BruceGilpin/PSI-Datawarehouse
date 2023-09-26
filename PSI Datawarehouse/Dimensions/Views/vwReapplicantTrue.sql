
/**********************************************
CREATED BY: William Davis
CREATED ON: 09/14/2023
DESC:
	Creates a view where Reapplicant are y
	Should use as a left join with ISNULL = N to limit rows and increase performance

*********************************************/
CREATE VIEW
	[Dimensions].[vwReapplicantTrue]
AS
SELECT
	 scod.StudentScoresKey,  
	[PoolTitle] AS Reapplicant
FROM
	[PSI_DW].[Dimensions].[StudentCodes] scod WITH (NOLOCK)

INNER JOIN
	[PSI_DW].[Dimensions].[PoolCodeGroups] pcgr WITH (NOLOCK)
ON
	scod.poolCodeGroupKey = pcgr.[PoolCodeGroupDBID] AND pcgr.CurrentFlag = 0
INNER JOIN
	[PSI_DW].[Dimensions].[PoolCodes] pcod WITH (NOLOCK)
ON
	scod.PoolCode = pcod.PoolCodeDBID AND pcod.CurrentFlag = 0
WHERE
	[PoolGroupTitle] = 'Reapplicant'
AND
	[PoolTitle] = 'Y'
