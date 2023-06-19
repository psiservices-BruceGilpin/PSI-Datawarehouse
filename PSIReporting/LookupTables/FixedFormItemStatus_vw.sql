/****** Object:  View [LookupTables].[FixedFormItemStatus_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [LookupTables].[FixedFormItemStatus_vw]
	AS SELECT 
	a.SourceTestFixedFormItemStatusKey FixedFormItemStatus,
	a.[Description] ItemStatus,
	b.SourceSystemName
	FROM [$(PSI_DW)]..DimTestFixedFormItemStatus a with (nolock) join
	[$(PSI_DW)]..SourceSystems b with (nolock) on
		a.SourceSystemKey = b.SourceSystemId