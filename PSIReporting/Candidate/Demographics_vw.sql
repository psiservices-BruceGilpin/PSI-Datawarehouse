CREATE VIEW [Candidate].[Demographics_vw]
	AS 
	Select
		DemographicTypeKey,
		DemographicValue,
		DemographicID
	from
		[$(PSI_DW)].Candidate.Demographics
