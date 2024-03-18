CREATE VIEW [dbo].[KeyCrossReference_vw]
	AS 

SELECT [Studentkey]
      ,[StudentScoreKey]
      ,[Testdate]
      ,[TestPackageKey]
      ,[PackageTitle]
      ,[SummaryTestName]
      ,[DimensionsTestKey]

  FROM  [$(PSI_DW)].dbo.[KeyCrossReference]

GO


