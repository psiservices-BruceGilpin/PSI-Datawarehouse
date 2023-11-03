CREATE VIEW [Dimensions].[StudentResponses_vw]
	AS SELECT 
	StudentResponseDBID,
	StudentItemKey,
	NumericChoice,
	StringChoice,
	ResponseIndex,
	Points
	from
	[$(PSI_DW)].Dimensions.StudentResponses (nolock)
	where CurrentFlag = 0

