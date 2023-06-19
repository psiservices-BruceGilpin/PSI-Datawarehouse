/****** Object:  View [LookupTables].[ActiveStatus_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [LookupTables].[ActiveStatus_vw]
	AS 
	SELECT 
	a.ActiveStatusCode,
	a.ActiveStatusState,
	b.SourceSystemName SourceSystem
	FROM [$(PSI_DW)]..DimActiveStatus a with (nolock) join
	[$(PSI_DW)]..SourceSystems b with (nolock) on
		a.SourceSystemID = b.SourceSystemId