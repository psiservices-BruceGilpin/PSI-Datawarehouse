CREATE PROCEDURE [dbo].[uspExamNotesProcessing]
	@startdate datetime,
	@enddate datetime
AS
	create table #Jnote		(stepid int, stepname varchar(50), JsonStr varchar(max), strtype int  )
	create table #Jnote2	(stepid int, stepname varchar(50), JsonStr varchar(max), strtype int  )
	create table #Jnote3	(stepid int, stepname varchar(50), JsonStr varchar(max), strtype int  )
	create table #Jnote4	(stepid int, stepname varchar(50), JsonStr varchar(max), strtype int  )

	create table #StepNotes (SessionStepKey bigint, note varchar(max))


	declare 
		@stepid bigint
		, @state int
		, @note varchar(max)
		, @key varchar(50)
		, @type int
		

		Insert into #StepNotes (SessionStepKey, note)
		select
			b.TestSessionStepID, c.note
		from
			bridge.testsession a join
			bridge.TestSessionStep b on
				a.TestSessionId = b.TestSessionKey join
			staging.StagingTestSessionStep c on
				b.TestSessionKey = c.SessionID and
				b.StepOrder = c.StepOrder
		where
			a.TestDate between @startdate and @enddate and
			isjson(c.note) = 1


	declare cu1 cursor  for

		select a.testsessionstepkey, b.note
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
			b.TestSessionStepID, c.StepName, c.note
		from
			bridge.testsession a join
			bridge.TestSessionStep b on
				a.TestSessionId = b.TestSessionKey join
			staging.StagingTestSessionStep c on
				b.TestSessionKey = c.SessionID and
				b.StepOrder = c.StepOrder
		where
			a.TestDate between @startdate and @enddate and
			isjson(c.note) <> 1	

RETURN 0