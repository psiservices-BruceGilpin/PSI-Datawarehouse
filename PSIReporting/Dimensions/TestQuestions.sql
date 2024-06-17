CREATE VIEW [Dimensions].[TestQuestions_vw]
	AS SELECT 
		TestQuestionDBID,
		SourceTestQuestionID,
		TestSegmentsKey,
		QuestionKey,
		Section,
		QuestionSequence

	from
		[$(PSI_DW)].Dimensions.TestQuestions (nolock)
	