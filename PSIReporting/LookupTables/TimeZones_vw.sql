/****** Object:  View [LookupTables].[TimeZones_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [LookupTables].[TimeZones_vw]
	AS SELECT 
	c.CountryName,
	a.TimeZoneDesc,
	a.RawUTCOffset,
	a.OffsetInHours,
	a.OffsetInMinutes
	FROM [$(PSI_DW)]..DimTimeZones a with (nolock) join
	[$(PSI_DW)]..SourceSystems b with (nolock) on
		a.SourceSystemID = b.SourceSystemId join
	[$(PSI_DW)]..DimCountries c on
		a.CountryKey = c.CountryID