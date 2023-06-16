CREATE PROCEDURE [Summary].[uspSchoolPassRatesMaint]

AS
	declare @minloaddate datetime, @maxLoaddate date, @newrows int, @createdate datetime, @lastLoadDate date, @rwcnt int
    create table #tmprates (SchoolID int, PortionID int, testdate date, alln int, allfirsttime int, firsttimepass int, allpass int, firsttimepassrate decimal(10,3), AllpassRate decimal(10,3))

        Begin try
            Select  @MaxLoadDate = MaxLoadDate,
                    @minloaddate = MinLoadDate
            from Logging.SummaryTableLoadHistory
            where TableName = 'Summary.SchoolMeasures'


       if @@ROWCOUNT = 0
            Return 100      -- Table must be in SummaryTableLoadHistory

        if @maxLoaddate >= cast(getdate() as date)
            Return 200  -- do not load current date

        select 1
            from Summary.SchoolMeasures
            where AsOfDate >= @minloaddate
        if @@ROWCOUNT > 0
            Return 300      -- date range already loaded
         



        insert into #tmprates (SchoolID, PortionID, testdate)
                select e.AccountSchoolDBId, b.TestPortionKey, cast(a.TestDate as date)
        from
	        Candidate.TestAssignments a join
	        candidate.TestAssignmentPortions b on
		        a.TestAssignmentDBID = b.TestAssignKey and
		        a.CurrentFlag = 0 and b.CurrentFlag = 0 join
	        Candidate.Candidates c on
		        a.CandidateKey = c.CandidateDBId and
		        c.CurrentFlag = 0 join
	        Account.AccountSchool e on
		        c.SchoolKey = e.AccountSchoolDBId and
		        e.CurrentFlag = 0
        where
                   a.TestDate > @MinLoaddate and cast(a.testdate as date) <= @MaxLoaddate
        group by
                        e.AccountSchoolDBId, b.TestPortionKey, cast(a.TestDate as date);
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
  
    Set @lastLoadDate = @minloaddate


    while @lastLoadDate <= @maxLoaddate
    Begin
  
        Begin Try
            -- All candidates
            with passcount (testportionkey, schoolkey,  cnt) as
	                (select b.testportionkey, c.SchoolKey, count(*) cnt
	                from
	                    Candidate.TestAssignments a join
	                    candidate.TestAssignmentPortions b on
		                    a.TestAssignmentDBID = b.TestAssignKey and
		                    a.CurrentFlag = 0 and b.CurrentFlag = 0 join
	                    Candidate.Candidates c on
		                    a.CandidateKey = c.CandidateDBId and
		                    c.CurrentFlag = 0 join
	                    Account.AccountSchool e on
		                    c.SchoolKey = e.AccountSchoolDBId and
		                    e.CurrentFlag = 0
	                where  
                        cast(a.TestDate as date) <= @lastLoadDate
	                group by Schoolkey, TestPortionKey )
                Update #tmprates 
                    set allN = cnt
                from 
                    #tmprates b join
                    passcount a  on
                    a.testportionkey = b.portionID and
                    a.schoolkey = b.SchoolID and
                    b.testdate  = @lastLoadDate;
            -- Total first time  candidates
                 with passcount (testportionkey, schoolkey,  cnt) as
	                (select b.testportionkey, c.schoolkey,  count(*) cnt
	                from
	                    Candidate.TestAssignments a join
	                    candidate.TestAssignmentPortions b on
		                    a.TestAssignmentDBID = b.TestAssignKey and
		                    a.CurrentFlag = 0 and b.CurrentFlag = 0 join
	                    Candidate.Candidates c on
		                    a.CandidateKey = c.CandidateDBId and
		                    c.CurrentFlag = 0 join
	                    Account.AccountSchool e on
		                    c.SchoolKey = e.AccountSchoolDBId and
		                    e.CurrentFlag = 0
	                where  b.Take# = 1 and
                             cast(a.TestDate as date) <= @lastLoadDate
	                group by TestPortionKey, SchoolKey )
                Update #tmprates 
                    set allfirsttime = cnt
                from 
                    #tmprates b join
                    passcount a  on
                    a.testportionkey = b.portionID and
                    a.schoolkey = b.SchoolID and
                    b.testdate  = @lastLoadDate;
            -- Total Passing

                with passcount (testportionkey, SchoolKey, cnt) as
	                (select b.testportionkey, c.SchoolKey, count(*) cnt
                     from
	                    Candidate.TestAssignments a join
	                    candidate.TestAssignmentPortions b on
		                    a.TestAssignmentDBID = b.TestAssignKey and
		                    a.CurrentFlag = 0 and b.CurrentFlag = 0 join
	                    Candidate.Candidates c on
		                    a.CandidateKey = c.CandidateDBId and
		                    c.CurrentFlag = 0 join
	                    Account.AccountSchool e on
		                    c.SchoolKey = e.AccountSchoolDBId and
		                    e.CurrentFlag = 0
	                where Result = 'Pass' and
                             cast(a.TestDate as date) <= @lastLoadDate
	                group by TestPortionKey, SchoolKey) 
                update #tmprates
                    set allpass = isnull(cnt,0)
                    from passcount a
                    where portionID = a.testportionkey and
                          testdate = @lastLoadDate;

            -- First Time pass
            with passcount (testportionkey, SchoolKey, cnt) as
	            (select b.testportionkey, c.SchoolKey, count(*) cnt
                     from
	                    Candidate.TestAssignments a join
	                    candidate.TestAssignmentPortions b on
		                    a.TestAssignmentDBID = b.TestAssignKey and
		                    a.CurrentFlag = 0 and b.CurrentFlag = 0 join
	                    Candidate.Candidates c on
		                    a.CandidateKey = c.CandidateDBId and
		                    c.CurrentFlag = 0 join
	                    Account.AccountSchool e on
		                    c.SchoolKey = e.AccountSchoolDBId and
		                    e.CurrentFlag = 0	            
                  where Result = 'Pass' and Take# = 1 and  a.TestDate <= @lastLoadDate
	              group by TestPortionKey, c.SchoolKey) 
            update #tmprates
            set firsttimepass = isnull(cnt,0)
            from passcount a
            where portionID = a.testportionkey and
                  testdate = @lastLoadDate;


            update #tmprates
            set AllpassRate = cast((allpass * 1.0) / (alln * 1.0) as decimal(10,3))
            where alln > 0 and alln is not null;

            update #tmprates
            set firsttimepassrate = cast((firsttimepass * 1.0) / (allfirsttime * 1.0) as decimal(10,3))
            where allfirsttime > 0 and allfirsttime is not null;
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
                return -1
	    end catch

  
        select @lastLoadDate = dateadd(day,1,@lastloadDate)
    End

          begin try
            insert Summary.SchoolMeasures(SchoolKey, PortionKey, 
                                        AllCandidateN, AllCandidatePass, AllCandidatePassRate, 
                                        FirstTimeN,FirstTimePass, FirstTimePassRate, AsOfDate )
            select
                a.SchoolID,
                b.PortionDBID,
                a.alln,
                isnull(a.allpass,0),
                a.AllpassRate,
                a.allfirsttime,
                isnull(a.firsttimepass,0),
                a.firsttimepassrate,
                a.testdate
            from
                #tmprates a join
                test.Portion b on
                    a.portionID = b.PortionDBID and
                    b.currentflag = 0 
            set @newrows = @@ROWCOUNT

            Update Logging.SummaryTableLoadHistory
            set MaxLoadDate = dateadd(day,1,@lastloaddate),
                MinLoadDate = @lastLoadDate
             where TableName = 'Summary.SchoolMeasures'
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
                return -1
	    end catch


   



RETURN @newrows