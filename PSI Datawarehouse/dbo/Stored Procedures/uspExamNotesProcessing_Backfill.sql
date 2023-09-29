CREATE PROCEDURE [dbo].[uspExamNotesProcessing_Backfill]
	@startdate datetime,
	@enddate datetime
AS
	create table #Jnote		(stepid int, stepname varchar(50), JsonStr varchar(max), strtype int  )
	create table #Jnote2	(stepid int, stepname varchar(50), JsonStr varchar(max), strtype int  )
	create table #Jnote3	(stepid int, stepname varchar(50), JsonStr varchar(max), strtype int  )
	create table #Jnote4	(stepid int, stepname varchar(50), JsonStr varchar(max), strtype int  )

	create table #SessionKeys (dossierKey varchar(40), sessionkey varchar(40))
	create table #StepNotes (SessionStepKey bigint, note varchar(max))

	
	declare 
		@stepid bigint
		, @state int
		, @note varchar(max)
		, @key varchar(50)
		, @type int
		
		begin try
		truncate table staging.stagingtestsessionnotes

		insert into #SessionKeys (dossierKey, sessionkey)
			Select distinct b.DossierKey, b.SessionKey
		from psi_Staging.Staging.ExamState a left join
			 Bridge.TestSession b on
			a.pdiddy =  b.dossierKey + '::' + b.SessionKey 
		where b.DossierKey is not null and
			a.[Timestamp] between @startdate and @enddate 

		if @@ROWCOUNT = 0
		begin
			Insert Logging.SQLErrors (
				ErrorLIne,
				ErrorMessage,
				ErrorNumber,
				ErrorProcedure,
				ErrorSeverity,
				ErrorDateTime )
			Values (
				ERROR_LINE(),
				'No Exam sessions found within the date range supplied.',
				50001,
				'USPExamStepNotesProcessing_backfill',
				15,
				getdate() )

		end
		else
		begin

		Insert into #StepNotes (SessionStepKey, note)
		select
			b.TestSessionStepID, c.note
		from
			bridge.testsession a join
			bridge.TestSessionStep b on
				a.TestSessionId = b.TestSessionKey join
			staging.StagingTestSessionStep c on
				b.TestSessionKey = c.SessionID and
				b.StepOrder = c.StepOrder			left join
			Bridge.TestSessionNotes d on
				b.TestSessionStepId = d.TestSessionStepKey
		where
			a.TestDate between @startdate and @enddate and
			isjson(c.note) = 1 and
			d.TestSessionStepKey is null


	declare cu1 cursor  for

		select sessionstepkey, note
		from
			 #StepNotes		
		where ISJSON(note) = 1

	open cu1
	fetch next from cu1 into @stepid, @note

	While @@FETCH_STATUS = 0
	Begin

		insert into #Jnote (stepid,stepname,JsonStr, strtype)
		select @stepid, *
		from OpenJson(@note)
		fetch next from cu1 into @stepid, @note
	end

	close cu1
	deallocate cu1

	declare cu2 cursor  for 
		select stepid, JsonStr
		from #Jnote
		where strtype = 4
	
	open cu2
	fetch next from cu2 into @stepid, @note
	while @@FETCH_STATUS = 0
	begin
		insert into #Jnote2 (stepid,stepname,JsonStr, strtype)
		select @stepid, *
		from OpenJson(@note)
		fetch next from cu2 into @stepid, @note
	end

	close cu2
	deallocate cu2

	declare cu3 cursor  for 
	select stepid, JsonStr
	from #Jnote2
	where strtype = 5
	open cu3
	fetch next from cu3 into @stepid, @note
	while @@FETCH_STATUS = 0
	begin
		insert into #Jnote3 (stepid,stepname,JsonStr, strtype)
		select @stepid, *
		from OpenJson(@note)
		fetch next from cu3 into @stepid, @note
	end
		--select distinct strtype from #Jnote
	close cu3
	deallocate cu3

	declare cu4 cursor  for 
	select stepid, JsonStr
	from #Jnote3
	where strtype = 4
	open cu4
	fetch next from cu4 into @stepid, @note
	while @@FETCH_STATUS = 0
	begin
		insert into #Jnote4 (stepid,stepname,JsonStr, strtype)
		select @stepid, *
		from OpenJson(@note)
		fetch next from cu4 into @stepid, @note
	end
		--select distinct strtype from #Jnote
	close cu4
	deallocate cu4

	Insert into Staging.StagingTestSessionNotes (StepID,NoteType,NoteText)

	select stepid, stepname, JsonStr from #Jnote where strtype = 1
	union
	select stepid, stepname, JsonStr from #Jnote3 where strtype = 1
	union
	select stepid, stepname, JsonStr from #Jnote4
	union
	select
			b.TestSessionStepID, d.StepName, c.note
		from
			bridge.testsession a join
			bridge.TestSessionStep b on
				a.TestSessionId = b.TestSessionKey join
			staging.StagingTestSessionStep c on
				b.TestSessionKey = c.SessionID and
				b.StepOrder = c.StepOrder join
				DimExamSteps d on 
					c.StepKey = d.ExamStepId
		where
			a.TestDate between @startdate and @enddate and
			isjson(c.note) <> 1	


	Insert into Bridge.TestSessionNotes 
		(TestSessionStepKey, NoteType,NoteText)
	select
		Stepid, notetype, notetext
	from Staging.StagingTestSessionNotes
	end
		
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