/****** Object:  View [LookupTables].[ExhibitType_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [LookupTables].[ExhibitType_vw]
	AS SELECT 
	a.SourceExhibitTypeKey ExhibitType,
	a.[Description] ExhibitDescription,
	b.SourceSystemName
	FROM [$(PSI_DW)]..DimExhibitType a with (nolock) join
	[$(PSI_DW)]..SourceSystems b with (nolock) on
		a.SourceSystemKey = b.SourceSystemId