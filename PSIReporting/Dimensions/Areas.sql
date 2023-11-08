CREATE VIEW [Dimensions].[Areas_vw]
	AS 
	SELECT 
		AreaDBID,
		AreaTitle,
		AreaDescirption AreaDescription,
		SourceAreaID
	from 
		[$(PSI_DW)].Dimensions.Areas (nolock)
	where
		CurrentFlag = 0
