/****** Object:  View [LookupTables].[LanguageMaster_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [LookupTables].[LanguageMaster_vw]
	AS SELECT 
	a.LanguageName, 
	a.NativeName,
	a.LanguageCode,
	b.SourceSystemName
	FROM [$(PSI_DW)]..DimLanguageMaster a with (nolock) join
	[$(PSI_DW)]..SourceSystems b with (nolock) on
		a.SourceSystemKey = b.SourceSystemId