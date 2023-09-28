﻿CREATE VIEW [Dimensions].[StudentGroups_vw]
	AS SELECT 
		StudentGroupDBID,
		SourceGroupID,
		StudentPoolKey,
		PoolKey,
		StudentGrpTitle

	From
		[$(PSI_DW)].Dimensions.StudentGroups (nolock)
	where
		CurrentFlag = 0
