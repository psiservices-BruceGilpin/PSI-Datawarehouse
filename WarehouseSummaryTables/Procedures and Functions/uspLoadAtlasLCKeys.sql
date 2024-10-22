CREATE PROCEDURE [dbo].[uspLoadAtlasLCKeys]

AS
Begin Try
	select  distinct CandidateIDTypeKey
	into #candidateTypes
	from
	PSI_Staging.staging.AtlasLCKeys

	insert  Candidates.IDTypes (CandidateIDType, SourceSystemkey)

	select
		CandidateIDTypeKey,
		1
		from #candidateTypes a 
		left join
		Candidates.IDTypes b on
			a.CandidateIDTypeKey = b.CandidateIDType
		where b.CandidateTypeid is null

	insert
		AtlasLC.CandidateTestResultKeys 
		(
			TestRegnID,
			CandidateKey,
			CandidateIDTypeKey,
			TestKey,
			SchoolKey,
			ScheduleKey,
			TestDate,
			AccountKey,
			TestAssignmentKey,
			PortionKey,
			[Checksum]
		)
	select
		a.TestRegnId,
		b.CandidateDBID,
		i.CandidateTypeID,
		c.TestDBID,
		d.AccountSchoolDBID,
		e.CandidateTestScheduledbID,
		a.TestDate,
		f.AccountDBID,
		g.TestAssignmentDBID,
		h.PortionDBID,
		a.[Checksum]
	from
		PSI_Staging.staging.AtlasLCKeys a 
		join
		psi_dw.candidate.candidates_vw b on
		a.candidateid = b.CandidateAltKey
		join
		psi_dw.Test.tests_vw c on
			a.TestID = cast(c.sourcetestkey as int)
		join
		psi_dw.account.AccountSchool_vw d on
			a.SchoolID = cast(d.SourceAccountSchoolKey as int)
		join
		PSI_DW.Candidate.CandidateSchedule_vw e on
			a.ScheduleID = cast(e.SourceTestScheduleKey as int)
		join
		PSI_DW.Account.Accounts_vw f on
			a.AccountID = cast(f.sourceaccountid as int) 
		join
		PSI_DW.Candidate.TestAssignments_vw g on
			a.TestAssignmentID = cast(g.SourceTestAssignKey as int)
		join
		psi_dw.test.Portion_vw h on
			a.PortionID = cast(h.SourcePortionKey as int)
		join
		Candidates.IDTypes i on
			a.CandidateIDTypeKey = i.CandidateIDType
		left join
		AtlasLC.CandidateTestResultKeys j on
			a.Checksum = j.Checksum
		where j.Checksum is null
End Try
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



	

RETURN 0
