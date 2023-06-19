/****** Object:  View [LookupTables].[Countries_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [LookupTables].[Countries_vw]
	AS SELECT 
	 CountryId,
	 CountryName,
	 CountryCode,
	 CountryCodeAlpha3,
	 SortOrder
	FROM [$(PSI_DW)]..DimCountries with (nolock)