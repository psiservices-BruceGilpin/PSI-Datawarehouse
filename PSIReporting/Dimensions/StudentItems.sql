CREATE VIEW [dimensions].[StudentItems_vw]
	AS SELECT 
		StudentItemDBID,
		SourceSystemID,
		StudentScoreKey,
		TestQuestionKey,
		Points,
		Correct,
		QuestionTime,
		ElapsedTime,
		MaxPoints,
		QuestionSequence,
		FinalPoints,
		ExtraPoints

	From
	[$(PSI_DW)].Dimensions.StudentItems (nolock)
	