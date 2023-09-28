CREATE VIEW [Dimensions].[StudentCodes_vw]
	AS SELECT 
	StudentCodeId,
	StudentScoresKey,
	PoolCode
from
	[$(PSI_DW)].Dimensions.StudentCodes (nolock)

