CREATE VIEW [Dimensions].[PoolCodeGroups_vw]
	AS 
	SELECT 
		PoolCodeGroupDBID,
		PoolKey,
		PoolGroupTitle,
		PoolGroupDescription
	
	from
		[$(PSI_DW)].Dimensions.PoolCodeGroups (nolock)
	where
		CurrentFlag = 0
