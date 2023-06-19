/****** Object:  View [Candidate].[TestAssignments_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Candidate].[TestAssignments_vw]
	AS 


SELECT a.[TestAssignmentDBId]
      ,a.[SourceTestAssignKey]
      ,a.[SourceSystemKey]
      ,a.[TestKey]
      ,a.[AccountKey]
      ,a.[CandidateKey]
      ,a.[TestScheduleKey]
      ,a.[TestDate]
      ,a.[StartTime]
      ,a.[EndTime]
      ,a.[TotalElapsedTime]
      ,a.[CheckInTime]
      ,a.[UpdloadMode]
      ,a.[CreateDate]
      ,a.[SeatID]
      ,isnull(b.LanguageName, 'Not Found') CheckinLanguage
      ,isnull(c.LanguageName, 'Not Found') ProctorLanguage
  FROM [$(PSI_DW)].[Candidate].[TestAssignments] a with (nolock) left join
    [$(PSI_DW)]..DimLanguageMaster b with (nolock) on
        a.CheckinLanguageKey = b.LanguageMasterId left join
        [$(PSI_DW)]..DimLanguageMaster c with (nolock) on
            a.ProctorLanguageKey = c.LanguageMasterId 
  Where a.[CurrentFlag] = 0