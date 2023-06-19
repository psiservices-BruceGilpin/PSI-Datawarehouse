/****** Object:  View [Test].[TestCenter_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Test].[TestCenter_vw]
	AS 

SELECT a.[TestCenterDBID]
      ,a.[SourceSystemKey]
      ,a.[SourceTestCenterKey]
      ,a.[TestCenterName]
      ,a.[Address1]
      ,a.[Address2]
      ,a.[City]
      ,a.[State]
      ,a.[Zip]
      ,c.CountryName
      ,b.description PropertyType
      ,a.GlobalTestCenterKey

  FROM [$(PSI_DW)].[Test].[TestCenter] a with (nolock) left join
        [$(PSI_DW)]..DimLookups b with (nolock) on
            a.PropertyType = b.LookupName join
        [$(PSI_DW)]..DimCountries c with (nolock) on
            a.CountryKey = c.CountryID
  where a.[CurrentFlag] = 0