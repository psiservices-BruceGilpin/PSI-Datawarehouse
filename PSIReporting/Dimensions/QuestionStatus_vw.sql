CREATE VIEW [Dimensions].[QuestionStatus_vw]
	AS SELECT 
		QuestionStatusDBID,
		StatusTitle QuestionStatusTitle,
		StatusDescription QuestionStatusDesc
	from
		[$(PSI_DW)].Dimensions.QuestionStatus (nolock)
	where
		Currentflag = 0