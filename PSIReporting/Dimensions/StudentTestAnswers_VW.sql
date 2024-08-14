CREATE VIEW [dbo].[StudentTestAnswers_VW]
	AS 
	SELECT 
	 b.StudentScoreKey,
	 c.questionsequence,
	 A.NumericChoice + 1 NumericChoice,
	 a.ResponseIndex,
	 a.Points,
	 a.StringChoice,
	 b.ElapsedTime,
	 b.StudentItemDBId,
	 a.StudentResponseDBID,
	 b.TestQuestionKey

  FROM [$(PSI_DW)].[Dimensions].[StudentResponses] a
  join
  [$(PSI_DW)].Dimensions.StudentItems b on
	a.StudentItemKey = b.StudentItemDBID 
  join
  [$(PSI_DW)].dimensions.TestQuestions c on
	b.TestQuestionKey = c.TestQuestionDBID 

