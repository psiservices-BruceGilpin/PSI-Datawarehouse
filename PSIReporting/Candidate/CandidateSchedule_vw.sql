/****** Object:  View [Candidate].[CandidateSchedule_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Candidate].[CandidateSchedule_vw]
	AS 
	SELECT a.[CandidateTestScheduleId]
      ,[SourceTestScheduleKey]
      ,c.SourceSystemName
      ,a.[CandidateKey]
      ,[TestCenterScheduleKey]
      ,[ScheduleDate]
      ,[CountryKey]
      ,[TimeZoneKey]
      ,[IsReschedule]
      ,isnull(b.[Description], a.[Status]) 'Schedule Status'
      ,[CandidateTestScheduleDBID]
      ,[PDiddyID]
      ,[ResultsExported]
      ,[PDiddyTimeStamp]
      ,[MultiMediaReady]
      ,[PriorDeliveryMethod]
      ,[SecureBrowserURL]
      ,[DeliveryMethodKey]
  FROM [$(PSI_DW)].Candidate.[TestSchedule] a left join
       [$(PSI_DW)].dbo.DimLookups b on
        a.[Status] = b.LookupName join
       [$(PSI_DW)].dbo.SourceSystems c on
        a.SourceSystemKey = c.SourceSystemId
  Where a.CurrentFlag = 0 and b.CurrentFlag = 0