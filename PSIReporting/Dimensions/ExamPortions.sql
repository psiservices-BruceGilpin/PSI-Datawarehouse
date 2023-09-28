CREATE VIEW [Dimensions].[ExamPortions_vw]
	AS 
	Select
		ExamPortionDBID,
		SourceSystemID,
		Code,
		Description PortionDescirption,
		CalculatorEn
		RefEn,
		LOFTEn
	From
		[$(PSI_DW)].Dimensions.ExamPortions (nolock)
	Where
		CurrentFlag = 0
