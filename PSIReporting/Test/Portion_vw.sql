/****** Object:  View [Test].[Portion_vw]    Script Date: 6/16/2023 1:44:54 PM ******/


CREATE VIEW [Test].[Portion_vw]
	AS 
	
SELECT a.[PortionDBId]
      ,a.[SourcePortionKey]
      ,a.[SourceSystemKey]
      ,a.[TestKey]
      ,a.[PortionName]
      ,a.[TestOrder]
      ,a.[Description]
      ,a.[IsScored]
      ,a.[MinItemCount]
      ,a.[Duration]
      ,a.[PassingScore]
      ,a.[ScaledCut]
      ,a.[CastingTrials]
      ,b.[Description] CastingType
      ,a.[CastingModel]
      ,a.[ItemCount]
      ,a.[ItemsToBeShown]
      ,a.[IsTimed]
      ,a.[TotalItemWeight]
      ,a.[TopicGroupingType]
      ,a.[IVRPortionName]
      ,a.[GroupLevelScoring]
      ,a.[FirstFormRandom]
      ,a.[VariableCutScores]
      ,a.[ClientCode]
       ,a.[CreateDate]
      ,a.[RawCut]
       ,c.PortionName 'PortionType'
  FROM [$(PSI_DW)].Test.[Portion] a with (nolock) join
       [$(PSI_DW)]..DimCastingType b with (nolock) on
        a.CastingTypeKey = b.CastingTypeID join
       [$(PSI_DW)]..DimPortionType c on
        a.PortionTypeKey = c.PortionIDId
  where   [CurrentFlag] = 0