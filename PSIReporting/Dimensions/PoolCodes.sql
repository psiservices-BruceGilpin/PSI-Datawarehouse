CREATE VIEW [Dimensions].[PoolCodes_vw]
	AS SELECT 
		PoolCodeDBID,
		SourcePoolCodeKey,
		PoolCodeGroupKey,
		PoolTitle,
		PoolDescription
	From
		[$(PSI_DW)].Dimensions.PoolCodes (nolock)
	Where
		CurrentFlag = 0
