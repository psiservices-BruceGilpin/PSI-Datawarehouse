/****** Object:  View [LookupTables].[ExhibitCategory_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [LookupTables].[ExhibitCategory_vw]
	AS SELECT 
	a.SourceExhibitCategoryKey ExhibitCategory,
	a.[Description] ExhibitDescription,
	b.SourceSystemName
	FROM [$(PSI_DW)]..DimExhibitCategory a with (nolock) join
	[$(PSI_DW)]..SourceSystems b with (nolock) on
		a.SourceSystemKey = b.SourceSystemId