/****** Object:  View [LookupTables].[ISG_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [LookupTables].[ISG_vw]
	AS SELECT 
		a.ISGKey,
		a.[Description] ISG,
		b.SourceSystemName
	FROM [$(PSI_DW)]..DimISG a with (nolock) join
	[$(PSI_DW)]..SourceSystems b with (nolock) on
		a.SourceSystemKey = b.SourceSystemId