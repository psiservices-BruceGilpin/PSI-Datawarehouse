/****** Object:  View [LookupTables].[PortionType_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [LookupTables].[PortionType_vw]
	AS SELECT 
	a.PortionName,
	a.PortionDescription,
	b.SourceSystemName
	FROM [$(PSI_DW)]..DimPortionType a with (nolock) join
	[$(PSI_DW)]..SourceSystems b with (nolock) on
		a.SourceSystemKey = b.SourceSystemId