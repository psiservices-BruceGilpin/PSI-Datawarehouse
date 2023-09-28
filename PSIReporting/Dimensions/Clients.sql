CREATE VIEW [Dimensions].[Clients_vw]
	AS 
	SELECT 
		ClientDBID,
		SourceSystemID,
		Code,
		Description ClientDescription,
		AtlasAccountCode,
		PoolKey
	From
		[$(PSI_DW)].Dimensions.Clients (nolock)
	Where
		CurrentFlag = 0

