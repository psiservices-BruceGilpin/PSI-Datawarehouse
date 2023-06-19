/****** Object:  View [LookupTables].[FixedFormStatus_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [LookupTables].[FixedFormStatus_vw]
	AS SELECT 
	a.SourceTestFixedFormStatusKey FixedFormStatusKey,
	a.[Description] FixedFormStatus
	FROM [$(PSI_DW)]..DimTestFixedFormStatus a with (nolock) join
	[$(PSI_DW)]..SourceSystems b with (nolock) on
		a.SourceSystemKey = b.SourceSystemId