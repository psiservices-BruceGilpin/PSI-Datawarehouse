CREATE VIEW [Dimensions].[Pools_vw]
	AS SELECT 
		PoolDbID,
		PoolCodeGroupKey,
		PoolTitle,
		PoolDesc
	From
		[$(PSI_DW)].Dimensions.Pools
	Where CurrentFlag = 0

