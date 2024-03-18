CREATE VIEW [Dimensions].[LoftPools_vw]
	AS 

SELECT [FormPoolDBID]
      ,[FormPoolSpecKey]
      ,[PoolName]
      ,[DateAdded]
      ,[IsScored]
      ,[CastCount]
  FROM [$(PSI_DW)].[Dimensions].[FormPools]
  Where [Currentflag] = 0

GO


