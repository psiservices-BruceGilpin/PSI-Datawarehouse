CREATE PROCEDURE [Reporting].[uspTestSessionNoNotes]
	@SessionID  int = null,
	@DossierKey varchar(40) = null,
	@SessionKey varchar(40) = null
AS
	If @SessionID is not null
	begin
	select 
		a.Account
		, a.TestSessionID
		, a.DossierKey
		, a.SessionKey
		, a.TestDate
		, a.StepOrder
		, a.StepName
		, a.StartTime
		, a.EndTime
		, a.TestSessionStepId
		, a.TotalDuration
		, a.StepDuration

		

	from
		Reporting.vwTestSessions_NoNotes a
	where 
	TestSessionId = @SessionID
	order by StepOrder
	end
	Else IF @DossierKey is not null and @SessionKey is null
	begin
		select 
			a.Account
			, a.TestSessionID
			, a.DossierKey
			, a.SessionKey
			, a.TestDate
			, a.StepOrder
			, a.StepName
			, a.StartTime
			, a.EndTime
			, a.EndTime
			, a.TestSessionStepId
			, a.TotalDuration
			, a.StepDuration
		

		from
			Reporting.vwTestSessions_NoNotes a
		where 
		a.DossierKey = @DossierKey
	order by a.SessionKey, StepOrder
	end
	Else IF @DossierKey is not null and @SessionKey is not null
	begin
		select 
			a.Account
			, a.TestSessionID
			, a.DossierKey
			, a.SessionKey
			, a.TestDate
			, a.StepOrder
			, a.StepName
			, a.StartTime
			, a.EndTime
			, a.EndTime
			, a.TestSessionStepId
			, a.TotalDuration
			, a.StepDuration
		from
			Reporting.vwTestSessions_NoNotes a
		where 
		a.DossierKey = @DossierKey and a.SessionKey = @SessionKey
	order by a.SessionKey, StepOrder
	end
RETURN 0