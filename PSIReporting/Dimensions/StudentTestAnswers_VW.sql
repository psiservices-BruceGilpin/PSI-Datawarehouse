CREATE VIEW [dbo].[StudentTestAnswers_VW]
	AS 
	SELECT 
	 a.StudentItemDBId,
	 b.NumericChoice + 1 NumericChoice,
	 b.ResponseIndex,
	 b.Points,
	 b.stringchoice

	From	
	[$(PSI_DW)].dimensions.StudentItems a	
	join
	[$(PSI_DW)].Dimensions.StudentResponses b on
		a.StudentItemDBId = b.StudentItemKey
	

