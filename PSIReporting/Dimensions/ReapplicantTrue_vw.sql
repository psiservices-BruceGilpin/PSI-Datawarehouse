﻿CREATE VIEW [Dimensions].[ReapplicantTrue_vw]
	AS SELECT 
		a.StudentScoresKey,
		c.PoolTitle as Reapplicant
	from
		[$(PSI_DW)].Dimensions.StudentCodes  (nolock) a		join
		[$(PSI_DW)].Dimensions.PoolCodeGroups (nolock) b on
			a.PoolCodeGroupKey = b.PoolCodeGroupDBID  and
			b.CurrentFlag = 0								join
		[$(PSI_DW)].Dimensions.PoolCodes c on
			a.PoolCode = c.PoolCodeDBID and c.CurrentFlag = 0
	where
		b.PoolGroupTitle = 'Reapplicant' and
		c.PoolTitle = 'Y'

			
			
		

