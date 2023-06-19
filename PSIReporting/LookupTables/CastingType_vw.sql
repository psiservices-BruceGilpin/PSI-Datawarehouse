/****** Object:  View [LookupTables].[CastingType_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [LookupTables].[CastingType_vw]
	AS 
	SELECT 
		a.CastingTypeID,
		a.[Description] CastingName,
		a.sourcecastingtypekey,
		b.SourceSystemName
	FROM [$(PSI_DW)]..DimCastingType a with (nolock) join
	[$(PSI_DW)]..SourceSystems b on
		a.SourceSystemKey = b.SourceSystemId