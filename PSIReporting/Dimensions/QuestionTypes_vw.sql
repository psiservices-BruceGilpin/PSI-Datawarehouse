CREATE VIEW [Dimensions].[QuestionTypes_vw]
	AS SELECT 
	QuestionTypeDBID,
	QuestionTypeTitle,
	QuestionTypeDesc
from
	[$(PSI_DW)].Dimensions.QuestionTypes
where
	CurrentFlag = 0
