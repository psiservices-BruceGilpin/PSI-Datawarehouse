/****** Object:  View [Test].[TestResponse_Vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Test].[TestResponse_Vw]
	AS 

SELECT [CandidateResponseDBId]
      ,[SourceSystemKey]
      ,[TestAssignPortionKey]
      ,[FixedFormKey]
      ,[ItemBankKey]
      ,[DisplayOrder]
      ,[TimeAllowed]
      ,[TimeElapsed]
      ,[IsCorrect]
      ,[IsMarked]
      ,[TimesChanged]
      ,[ISGFlag]
      ,[TotalWeightage]
      ,[Weightage]
      ,[DateCreated]
      ,[PartitionValue] TestYrMnth
  FROM [$(PSI_DW)].[Candidate].[Responses] with (nolock)
  Where
    [CurrentFlag] = 0