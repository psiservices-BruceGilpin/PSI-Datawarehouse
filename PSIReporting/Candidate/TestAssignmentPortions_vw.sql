/****** Object:  View [Candidate].[TestAssignmentPortions_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Candidate].[TestAssignmentPortions_vw]
	AS 

SELECT a.[TestAssignPortionDBId]
      ,a.[SourceSystemKey]
      ,b.SourcePortionKey 'AtlasLC Portion Id'
      ,a.[TestPortionKey]
      ,a.[TestAssignKey]
      ,b.[PortionName]
       ,a.[Take#]
       ,a.[ComputedAttempt#]
      ,b.PortionDBID
      ,a.[Score]
      ,a.[Result]
      ,a.[Attempt#]
      ,a.[StartTime]
      ,a.[EndTime]
      ,a.[ElapsedTime]
      ,a.[ExtendedTimeAllowed]
      ,a.[TestedPortionOrder]
      ,a.[AnsweredItemCount]
      ,a.[MarkedItemCount]
      ,a.[RawScore]
      ,a.[ScaledScore]
      ,a.[CurrentFlag]
      ,a.[CastedForm]
      ,a.[FixedFormKey]

  FROM [$(PSI_DW)].Candidate.[TestAssignmentPortions] a with (nolock) join
       [$(PSI_DW)].test.Portion b with (nolock)  on
        a.TestPortionKey = b.PortionDBID 
  where a.[Currentflag] = 0 and b.[CurrentFlag] = 0