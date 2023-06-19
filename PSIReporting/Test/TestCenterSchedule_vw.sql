/****** Object:  View [Test].[TestCenterSchedule_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Test].[TestCenterSchedule_vw]
	AS 


SELECT a.[TestCenterScheduleDBID]
      ,a.[BookingCode]
      ,a.[TestCenterKey]
      ,a.[ScheduleDate]
      ,a.[StartDate]
      ,a.[StartTime]
      ,a.[EndDate]
      ,a.[EndTime]
      ,a.[Duration]
      ,b.Description TestCenterStatus
      ,a.[SourceSystemKey]
      ,a.[SourceTestCenterSchKey]   
  FROM [$(PSI_DW)].[Test].[TestCenterSchedule] a with (nolock) join
  [$(PSI_DW)]..DimLookups b with (nolock) on
    a.[TestCenterStatus] = b.LookupName
  Where a.[CurrentFlag] = 0