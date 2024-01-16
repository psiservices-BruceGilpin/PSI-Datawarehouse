/****** Object:  View [dbo].[Countries]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [dbo].[Countries]
	AS SELECT 
	 CountryName,
	 CountryCode '2 Letter Country Cd',
	 CountryCodeAlpha3 '3 Letter Country Cd'
	FROM [$(PSI_DW)].dbo.DimCountries