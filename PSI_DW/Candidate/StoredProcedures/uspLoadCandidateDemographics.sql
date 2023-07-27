CREATE PROCEDURE [Candidate].[uspLoadCandidateDemographics]

AS
Begin
Declare @demographic varchar(50), @CandidateColumnName varchar(40), @sql1 varchar(1500), @Sql2 varchar(500)

set @sql1 = 
	'with demographic  (TestRegnKey, DemoGraphicID) as
(select 

	 b.TestRegnKey, d.DemographicId
from
	candidate.candidates_vw a join
	psi_staging.staging.candidateadditionalattributevalues b 
	on
	a.testregn_id = b.testregnkey join
	candidate.demographictypes c on	
		b.VariableID = c.sourceattributeid join
	Candidate.Demographics d on
		b.VariableValue = d.DemographicValue
where c.demographic = '
Begin try
		declare c1 cursor for
			Select distinct demographic, CandidateColumnName
			from Candidate.DemographicTypes
		open c1
		Fetch Next from c1 into @demographic, @CandidateColumnName
		while @@FETCH_STATUS = 0
		Begin

		set @sql1 = 
			'with demographic  (TestRegnKey, DemoGraphicID) as
		(select 

			 b.TestRegnKey, d.DemographicId
		from
			candidate.candidates_vw a join
			psi_staging.staging.candidateadditionalattributevalues b 
			on
			a.testregn_id = b.testregnkey join
			candidate.demographictypes c on	
				b.VariableID = c.sourceattributeid join
			Candidate.Demographics d on
				b.VariableValue = d.DemographicValue
		where c.demographic = ' + '''' + @demographic +  '''' +
			' )
		update Candidate.Candidates
			set ' +  @CandidateColumnName + 
		' = b.DemographicID 
		from
			Candidate.Candidates a join
			demographic b on 
				try_cast(a.SourceCandidateKey as numeric) = b.TestRegnKey and
				a.CurrentFlag = 0'


			Exec (@sql1)
	--	select @sql1
			Fetch Next from c1 into @demographic, @CandidateColumnName
	end
	-- Birthdate
		update
	candidate.candidates
		set birthdate = try_cast(variablevalue as date)
	from
		candidate.Candidates a join
		psi_staging.staging.candidateadditionalattributevalues b on
			try_cast(a.SourceCandidateKey as numeric)  = b.TestRegnKey
		where b.VariableID = 4
	end try
	Begin catch
		Insert Logging.SQLErrors (
			ErrorLIne,
			ErrorMessage,
			ErrorNumber,
			ErrorProcedure,
			ErrorSeverity,
			ErrorState,
			ErrorDateTime )
		Values (
			ERROR_LINE(),
			ERROR_MESSAGE(),
			ERROR_NUMBER(),
			ERROR_PROCEDURE(),
			ERROR_SEVERITY(),
			ERROR_STATE(),
			getdate() )
	end catch

-- Update Statement
--	with demographic  (TestRegnKey, DemoGraphicID) as
--(select 

--	 b.TestRegnKey, d.DemographicId
--from
--	candidate.candidates_vw a join
--	psi_staging.staging.candidateadditionalattributevalues b 
--	on
--	a.testregn_id = b.testregnkey join
--	candidate.demographictypes c on	
--		b.VariableID = c.sourceattributeid join
--	Candidate.Demographics d on
--		b.VariableValue = d.DemographicValue
--where c.demographic = 'race' )
--update Candidate.Candidates
--	set RaceCode = b.DemographicID
--from
--	Candidate.Candidates a join
--	demographic b on 
--		try_cast(a.SourceCandidateKey as numeric) = b.TestRegnKey and
--		a.CurrentFlag = 0	
	
end		


