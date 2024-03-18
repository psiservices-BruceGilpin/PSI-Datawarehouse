CREATE VIEW [Dimensions].[FormPoolItems_vw]
As

SELECT [FormPoolItemDBID]
      ,[FormPoolKey]
      ,[QuestionKey]
      ,[DeletedFlag]
      ,[DeActiveationDate]
      ,[Difficulty]
      ,[PointBiserial]
      ,[AngoffRating]
      ,[FriendlyName]
      ,[PTheta]
      ,[InfTheta]
      ,[Checksum]
  FROM [$(PSI_DW)].[Dimensions].[FormPoolItems]
  Where [CurrentFlag] = 0

GO

