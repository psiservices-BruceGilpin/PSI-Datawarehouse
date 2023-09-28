CREATE VIEW [Dimensions].[StudentLists_vw]
	AS SELECT 
		StudentListDBID,
		SourceStudentListID,
		StudentKey,
		StudentGroupKey,
		StudentListType,
		StudentStatus,
		HideReports,
		InsReports
	From
		[$(PSI_DW)].Dimensions.StudentLists (nolock)
	where
		CurrentFlag = 0
