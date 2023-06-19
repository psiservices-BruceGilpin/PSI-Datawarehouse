/****** Object:  View [Test].[FixedForm_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Test].[FixedForm_vw]
as
SELECT [FixedFormDBID]
      ,[SourceSystemKey]
      ,[SourceFixedFormID]
      ,[PortionKey]
      ,[FormName]
      ,[StatusKey]
      ,[PassingScore]
      ,[DateGenerated]
      ,[CreateDate]
  FROM [$(PSI_DW)].[Test].[FixedForm] with (nolock)
  Where [CurrentFlag] = 0