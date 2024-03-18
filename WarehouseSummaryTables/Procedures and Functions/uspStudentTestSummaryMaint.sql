CREATE PROCEDURE [Dimensions].[uspStudentTestSummaryMaint]
AS
	Set Nocount On;
	/*
		Form names are not uniquely linked to a test. Different admin types can be linked
		to the same test. This process ranks the forms base on admin type. 
		Admin type C7 makes up over 90% of the types in the table and in cases where more than
		form is linked to the test, the C7 admin type is used
	*/
	create table #Forms (FormTestKey int, FormName varchar(100))

	insert into #forms
	Select FormTestKey, FormName
	from (
	select FormTestKey, FormName,
	row_number() Over(Partition by FormTestKey order by FormAdminType
	asc) as Row#
	from
	(
	select Formtestkey, formname, FormAdminType from
	(
	select
	FormTestkey, FormName, FormAdminType
	from 
	[PSI_DW].dimensions.Ampforms_vw 
	where FormAdminType = 'S7' ) a
	union
	(
	select
	FormTestkey, Formname, FormAdminType
	from 
	[PSI_DW].dimensions.Ampforms_vw 
	where FormAdminType = 'P7' ) 
	union
	(
	select
	FormTestkey, Formname, FormAdminType
	from 
	[PSI_DW].dimensions.Ampforms_vw 
	where FormAdminType = 'C7' ) 
	) a
	) a
	where a.Row# = 1

	Create table #testdelta (
		[DWTestScoreKey] [bigint] NOT NULL,
		[DWTestKey] [bigint] NOT NULL,
		[ClientCode] Varchar(12) Null,
		[DWPackageKey] [bigint] NOT NULL,
		[DWStudentKey] [bigint] NOT NULL,
		[StudentAltID] [varchar](128) NULL,
		[FirstName] [varchar](30) NULL,
		[LastName] [varchar](30) NULL,
		[MaidenName] [varchar](25) NULL,
		[TestTitle] [varchar](50) NOT NULL,
		[FormName] [varchar](100) NULL,
		[DateSched] [date] NULL,
		[TestDate] [date] NOT NULL,
		[ElapsedTime] [int] NULL,
		[PassFail] [char](1) NULL,
		[FinalPoints] [int] NULL,
		[ExtraPoints] [int] NULL,
		[ScaledScore] [int] NULL,
		[ScorePoints] [int] NULL,
		[Attempt#] [int] NULL,
		[ComputedAttempt#] [int] NULL,
		[ADATime] [int] NULL,
		[ExtraTime] [int] NULL,
		[ExtraTimeUsed] [int] NULL,
		[ExtraStart] [datetime] NULL,
		[ExtraEnd] [datetime] NULL,
		[Proctored] [bit] NULL,
		[Restarts] [int] NULL,
		[TestVersion] [int] NULL,
		[LoadDateTime] [datetime] NULL,
		[Recertification] char(1),
		[Reapplicant] char(1),
		[CorrectPercentage] Decimal(6,2),
		[CheckSum] Bigint
		);

	Begin Try
		declare @maxloaddate datetime
		select @maxloaddate = max(loaddatetime)
		from DW_SummaryTables.Students.StudentTestSummary
		
		Insert #testdelta (
			[DWTestScoreKey],
			[DWTestKey],
			[ClientCode],
			[DWPackageKey],
			[DWStudentKey],
			[StudentAltID],
			[FirstName],
			[LastName],
			[MaidenName],
			[TestTitle],
			[FormName],
			[DateSched],
			[TestDate],
			[ElapsedTime],
			[PassFail],
			[FinalPoints],
			[ScaledScore],
			[ScorePoints],
			[Attempt#],
			[ADATime],
			[ExtraTime],
			[ExtraTimeUsed],
			[ExtraStart],
			[ExtraEnd],
			[Proctored],
			[Restarts],
			[TestVersion],
			[LoadDateTime],
			[CheckSum]
		)
	select distinct
	d.StudentScoreDBID
	,g.TestDbID
	,b.clientcode
	,e.TestPackageKey
	,a.StudentDBID
	,a.StudentAltID
	,a.FirstName
	,a.LastName
	,a.MaidenName
	,g.TestTitle
	,h.FormName
	,e.ScheduleStart
	,isnull(d.startdate,'1/1/2000')
	,d.HowLong
	,case 
		when d.PFA = 'P' then d.pfa
		when d.PFA = 'F' then d.pfa
		when d.PFA = 'A' then d.pfa
		when d.PFA = 'G' then d.pfa
		else '  '
	end PFA 
    ,d.FinalPoints
	,d.ScaledScore 
	,d.ScorePoints
	,d.Retake
	,d.AdaTime
	,d.ExtraTime
	,d.ExtraTimeUsed
	,d.ExtraStart
	,d.ExtraEnd
	,d.Proctored
	,d.Restarts
	,g.TestVersnum
	,d.Loaddate
	,checksum(testdbid, b.clientcode, e.testpackagekey,a.studentdbid, a.studentaltid,a.firstname, a.lastname,isnull(a.maidenname,' '),g.testtitle,h.formname,e.schedulestart,d.startdate,d.howlong,d.finalpoints,isnull(d.scaledscore,0),d.scorepoints,d.retake, d.AdaTime,d.extratime)

from 
  [PSI_DW].dimensions.Students_vw a 
  join [PSI_DW].Dimensions.StudentTestAttributes b on a.studentdbid = b.StudentKey
  join [PSI_DW].dimensions.studentlists_vw c on a.studentdbid = c.studentkey 
  join [PSI_DW].dimensions.StudentScores d on c.studentlistdbid = d.studentlistkey and d.CurrentFlag = 0
  join [PSI_DW].dimensions.TestSchedules_vw e on d.TestScheduleKey = e.TestScheduleDBID and b.TestScheduleKey = e.testscheduledbid
  join [PSI_DW].dimensions.testlists_vw f on d.testlistkey = f.testlistdbid 
  join [PSI_DW].Dimensions.Tests_vw g on f.testkey = g.testdbid 
  left join #Forms h on g.TestDbID = h.FormTestKey
  left join DW_SummaryTables.Students.StudentTestSummary j on d.StudentScoreDBID = j.DWTestScoreKey

	

where 		
			j.DWTestScoreKey is null and
			d.pfa is not null
		and j.DWStudentKey is null or d.loaddate > @Maxloaddate
	
		create index idx1 on #TestDelta (dwStudentKey, DWTestKey, TestDate asc);
			
		declare @dwstudentkey int, @dwTestKey int, @dwtestdate date, @testcount int

	update #testdelta
	set Reapplicant = 'Y'
	from
		   #testdelta a 
		   join
		   PSI_DW.Dimensions.studentCodes_vw b on a.dwtestscorekey = b.StudentScoresKey
		   join
		   PSI_DW.dimensions.PoolCodes_vw d on
			b.PoolCode = d.PoolCodeDBID and
			d.pooltitle = 'Y'
		   Join 
		   PSI_DW.Dimensions.PoolCodeGroups_vw c on 
			b.PoolCodeGroupKey = c.PoolCodeGroupDBID 
     Where c.PoolGroupTitle = 'Reapplicant';


	update #testdelta
	set Recertification = 'Y'
	from
		   #testdelta a 
		   join
		   PSI_DW.Dimensions.studentCodes_vw b on a.dwtestscorekey = b.StudentScoresKey
		   join
		   PSI_DW.Dimensions.PoolCodes_vw d on
			b.PoolCode = d.PoolCodeDBID and
			d.pooltitle = 'Y'
		   Join 
		   [PSI_DW].Dimensions.PoolCodeGroups_vw c on 
			b.PoolCodeGroupKey = c.PoolCodeGroupDBID 
     Where c.PoolGroupTitle = 'Recertification';

	 update #testdelta
	set CorrectPercentage = 
		case 
		when 
			b.totalpoints != 0 then (a.FinalPoints + isnull(a.ExtraPoints,0)) * 1.0 / b.totalpoints 
		else 0
		end	
	from
	#testdelta a join
	psi_dw.dimensions.tests_vw b on
		a.dwTestkey = b.testdbid



		


	Merge  DW_SummaryTables.Students.StudentTestSummary t
	Using #testdelta s on
		t.dwTestScoreKey = s.dwtestscorekey
	when not matched then
		insert ( 
			[DWTestScoreKey],
			[DWTestKey],
			[DWPackageKey],
			[DWStudentKey],
			[StudentAltID],
			[FirstName],
			[LastName],
			[MaidenName],
			[TestTitle],
			[FormName],
			[DateSched],
			[TestDate],
			[ElapsedTime],
			[PassFail],
			[FinalPoints],
			[ScaledScore],
			[ScorePoints],
			[Attempt#],
			[ADATime],
			[ExtraTime],
			[ExtraTimeUsed],
			[ExtraStart],
			[ExtraEnd],
			[Proctored],
			[Restarts],
			[TestVersion],
			[Recertification],
			[Reapplicant],
			[LoadDateTime],
			[Checksum],
			[CorrectPercentage])
		values (
			s.[DWTestScoreKey],
			s.[DWTestKey],
			s.[DWPackageKey],
			s.[DWStudentKey],
			s.[StudentAltID],
			s.[FirstName],
			s.[LastName],
			s.[MaidenName],
			s.[TestTitle],
			s.[FormName],
			s.[DateSched],
			s.[TestDate],
			s.[ElapsedTime],
			s.[PassFail],
			s.[FinalPoints],
			s.[ScaledScore],
			s.[ScorePoints],
			s.[Attempt#],
			s.[ADATime],
			s.[ExtraTime],
			s.[ExtraTimeUsed],
			s.[ExtraStart],
			s.[ExtraEnd],
			s.[Proctored],
			s.[Restarts],
			s.[TestVersion],
			s.[Recertification],
			s.[Reapplicant],
			getdate(),
			s.checksum,
			s.CorrectPercentage
	)
	
	when matched and s.[checksum] != t.[checksum] then
			update
			set
			   [DWStudentKey]		= s.DWStudentKey
			  ,[DWTestScoreKey]		= s.DWTestScoreKey
			  ,[DWTestKey]			= s.DWTestKey 
			  ,[DWPackageKey]		= s.dwpackagekey
			  ,[StudentAltID]		= s.StudentAltID
			  ,[FirstName]			= s.FirstName
			  ,[LastName]			= s.LastName
			  ,[MaidenName]			= s.MaidenName
			  ,[TestTitle]			= s.testtitle
			  ,[FormName]			= s.Formname
			  ,[DateSched]			= s.DateSched
			  ,[TestDate]			= s.TestDate
			  ,[ElapsedTime]		= s.ElapsedTime
			  ,[FinalPoints]		= s.FinalPoints
			  ,[ScaledScore]		= s.ScaledScore
			  ,[ScorePoints]		= s.ScorePoints
			  ,[Attempt#]			= s.Attempt#
			  ,[ADATime]			= s.ADATime
			  ,[ExtraTime]			= s.ExtraTime
			  ,[ExtraTimeUsed]		= s.ExtraTimeUsed
			  ,[ExtraStart]			= s.ExtraStart
			  ,[ExtraEnd]			= s.ExtraEnd
			  ,[Proctored]			= s.Proctored
			  ,[TestVersion]		= s.TestVersion
			  ,[PassFail]			= s.PassFail
			  ,[Recertification]	= s.Recertification
			  ,[Reapplicant]		= s.Reapplicant
			  ,[LoadDateTime]		= getdate()
			  ,[Checksum]			= s.[Checksum]
			  ,[CorrectPercentage]	= s.CorrectPercentage

	;
	
		Select @@ROWCOUNT 'Rows Affected'

		
-- Populate the ComputedAttempts# column		
		
		create table #temptestdates (
		id				bigint not null identity(1,1) primary key,
		studentkey		bigint not null,
		testkey			bigint not null,
		testdate		date not null,
		testcount		int,
		)



	insert into #temptestdates (studentkey, testkey, testdate)
	select dwstudentkey, dwtestkey, testdate
	from Dw_SummaryTables.Students.StudentTestSummary a 
	where computedattempt# is null
	order by dwstudentkey, dwtestkey, testdate

	create index idx1 on #temptestdates (studentkey, testkey, testdate asc)

	Declare   @updatect int = 0
	declare cu1 cursor for
		Select Studentkey, testkey, testdate from #temptestdates

		open cu1
		fetch next from cu1 into @dwStudentKey, @dwTestKey, @dwtestdate
		while @@FETCH_STATUS = 0
		begin
			select @testcount = count(*) + 1
			from
				DW_SummaryTables.Students.StudentTestSummary
			where
				DwStudentKey = @dwStudentKey and
				DwTestKey	 = @dwTestKey and
				TestDate < @dwtestdate
			update DW_summarytables.students.StudentTestSummary
				set ComputedAttempt# = isNull(@testcount,1)
			where
				DWStudentKey = @dwstudentkey and
				DWTestKey = @dwTestKey and
				TestDate = @dwtestdate
			fetch next from cu1 into @dwstudentkey, @dwTestKey, @dwtestdate
		end



	End Try
	Begin catch
	Insert psi_dw.Logging.SQLErrors (
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
