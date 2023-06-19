/****** Object:  View [LookupTables].[States_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [LookupTables].[States_vw]
	AS SELECT
	 b.CountryName,
	 a.StateName,
	 a.StateAbbreviation
	FROM [$(PSI_DW)]..DimStates a with (nolock) join
	[$(PSI_DW)]..DimCountries b with (nolock) on
		a.CountryId = b.CountryID