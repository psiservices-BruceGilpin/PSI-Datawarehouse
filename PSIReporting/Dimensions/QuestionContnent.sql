CREATE VIEW [Dimensions].[QuestionContnent_vw]
	AS SELECT 
		QuestionContentDBID,
		SourceQuestionContentId,
		QuestionKey,
		ContentIndex,
		ContentResult,
		Points,
		Correct,
		Feedback,
		HotspotX,
		HotspotY,
		HotspotW,
		HotspotH,
		Required,
		Forgivable
	From
		[$(PSI_DW)].Dimensions.QuestionContent
	where 
		CurrentFlag = 0
