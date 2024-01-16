CREATE VIEW [Dimensions].[Students_vw]
	AS SELECT 
		StudentDBID,
		SourceStudentID,
		PoolKey,
		StudentAltID,
		StudentType,
		FirstName,
		LastName,
		StudentEmail,
		Phone,
		AltPhone,
		ADA,
		Gender,
		Birthdate,
		MadienName MaidenName

	from
	[$(PSI_DW)].Dimensions.Students (nolock)
	where
		CurrentFlag = 0
