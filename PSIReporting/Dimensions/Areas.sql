CREATE VIEW [Dimensions].[Areas_vw]
	AS 
	SELECT 
		AreaDBID,
		AreaTitle,
		AreaDescirption AreaDescription
	from 
		[$(PSI_DW)].Dimensions.Areas (nolock)
	where
		CurrentFlag = 0
