CREATE PROCEDURE [dbo].[uspDossierMaint]
AS
Begin
	Begin try
		merge bridge.Testsession as tgt Using staging.StagingDossier as src on tgt.dossierkey = src.Dossier_id 
		and tgt.SessionKey = src.proctored_exam_id when not matched by target then 
		Insert (
			DossierKey
			, SessionKey
			, PDiddy
			, FName
			, LName 
			, Email
			, Account
			, RequestorCandidateKey
			, Checksum
			, LoadKey
			, LoadDate
		) 
		values 
		  (
			src.Dossier_Id, 
			src.proctored_exam_id, 
			src.Dossier_ID + '::' + src.Proctored_exam_id,
			isnull(src.other_given_name, 'unkown'), 
			isnull(src.family_name, 'unkown'), 
			src.candidate_email, 
			src.org_candidate, 
			src.RequestorCandidateID,
			src.checksum, 
			src.runid, 
			getdate()
		  ) when matched 
		  and src.checksum <> tgt.checksum then 
		update 
		set 
		  Fname = isnull(src.other_given_name, 'unkown'), 
		  LName = isnull(src.family_name, 'unkown'), 
		  Email = src.candidate_email, 
		  Account = src.org_candidate, 
		  RequestorCandidateKey = src.RequestorCandidateID,
		  checksum = src.checksum, 
		  LoadDate = getdate();

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

			








end
RETURN 0