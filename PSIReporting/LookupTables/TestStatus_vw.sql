/****** Object:  View [LookupTables].[TestStatus_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [LookupTables].[TestStatus_vw]
	AS SELECT 
	a.TestStatus,
	a.TestStatusDescription,
	b.SourceSystemName
	FROM [$(PSI_DW)]..DimTestStatus a with (nolock) join
	[$(PSI_DW)]..SourceSystems b with (nolock) on
		a.SourceSystemKey = b.SourceSystemId