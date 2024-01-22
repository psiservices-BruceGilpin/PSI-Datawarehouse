CREATE VIEW [Dimensions].[StudentCodes_vw]
	AS SELECT 
	StudentCodeId,
	StudentScoresKey,
	PoolCodeGroupKey,
	PoolCode
from
	[$(PSI_DW)].Dimensions.StudentCodes (nolock)

