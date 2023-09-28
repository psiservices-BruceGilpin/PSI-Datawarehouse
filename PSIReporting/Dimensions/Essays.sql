CREATE VIEW [Dimensions].[Essays_vw]
	AS SELECT 
		EssayDBID,
		StudentResponseKey,
		Essay
	from
	[$(PSI_DW)].Dimensions.Essays (nolock)
	Where
		CurrentFlag = 0

