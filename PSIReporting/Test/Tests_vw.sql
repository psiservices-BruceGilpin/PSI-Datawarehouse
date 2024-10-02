/****** Object:  View [Test].[Tests_vw]    Script Date: 6/16/2023 1:44:54 PM ******/


CREATE VIEW [Test].[Tests_vw]
as
SELECT [TestDBKey] TestDBID
      ,[SourceSystemKey]
      ,[TestName]
      ,[TestDescription]
      ,[CategoryKey]
      ,[AccountKey]
      ,[IVRTestName]
      ,[MarketSegment]
      ,[ClientCode]
      ,[GlobalTestID]
      ,[TestCreationDate]
      ,[ContentType]
      ,[ExamID]
      ,[ApiToken]
      ,[TestStatusKey]
      ,[TestTypeKey]
     
  FROM [$(PSI_DW)].[Test].[Tests] with (nolock)
  where  [CurrentFlag] = 0