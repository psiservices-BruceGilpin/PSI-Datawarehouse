CREATE VIEW [Bridge].[DossierDelta]
	AS 
		SELECT 
			a.dossier_id
			, a.proctored_exam_id
			, a.other_given_name
			, a.family_name
			, a.candidate_email
			, a.RunId
			, a.CheckSum
	FROM Staging.stagingdossier a left join
	Bridge.TestSession b on
		a.dossier_id = b.DossierKey and
		a.proctored_exam_id = b.SessionKey and
		a.CheckSum = b.Checksum
	where b.CheckSum is null and family_name not like 'Test_Takers%'