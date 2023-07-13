CREATE PROCEDURE [Candidate].[uspLoadCandidateDemographics]

AS
Begin
	declare @demotype nvarchar(3), @democolumn nvarchar(40), @statement NVarchar(2000), @variabletypes varchar(1500)
	declare c1 cursor for
		Select distinct DemographicTypeDBId, CandidateColumnName
		from Candidate.DemographicTypes
	Open C1
	Fetch Next from C1 into @demotype, @democolumn
	While @@FETCH_STATUS = 0
	Begin
		set @statement = 
		'With DemoValues (Candidatedbid, Democode, DemographicID) ' +
		'as ( '+
		'select  a.candidatedbid, b.variableID, c.DemographicId from ' +
		'Candidate.Candidates_vw a join ' +
		'PSI_Staging.Staging.CandidateAdditionalAttributeValues b on ' +
			'a.SourceCandidateKey = try_cast(b.TestRegnID as varchar(20)) join ' +
		'Candidate.Demographics c on ' +
			'b.variableID = c.DemographicTypeKey join ' +
		'Candidate.DemographicTypes d on ' +
		'c.DemographicTypeKey = d.SourceAttributeId ' +
		'Where d.demographicTypeDBID = ' + @demotype + ' )' +
		'Update Candidate.Candidates set ' + @democolumn + ' = a.DemographicID ' +
		'From ' +
			'DemoValues a join ' +
			'Candidate.Candidates b on ' +
				'a.candidateddbid = b.candidatedbid and b.currentflag = 0'
		Execute sp_executesql @statement
		Fetch Next from C1 into @demotype, @democolumn
	end
end		


