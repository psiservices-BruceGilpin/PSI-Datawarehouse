CREATE VIEW [Candidate].[DemographicTypes_vw]
	AS 
	Select 
		Demographic,
		DemographicTypeDBId,
		CandidateColumnName
	from
		[$(PSI_DW)].Candidate.DemographicTypes
