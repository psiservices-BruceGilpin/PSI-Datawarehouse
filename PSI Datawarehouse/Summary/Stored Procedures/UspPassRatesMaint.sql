CREATE PROCEDURE [Summary].[UspPassRatesMaint]

AS
    declare @minloaddate datetime, @maxLoaddate date, @refloadDate date, @newrows int, @createdate datetime, @lastLoadDate date, @rwcnt int
    create table #tmprates (portionID int, testdate date, alln int, allfirsttime int, firsttimepass int, allpass int, firsttimepassrate decimal(10,3), AllpassRate decimal(10,3))

        Begin try
            Select  @MaxLoadDate = MaxLoadDate,
                    @minloaddate = MinLoadDate,
                    @refloadDate = LoadRefDate
            from Logging.SummaryTableLoadHistory
            where TableName = 'Summary.PortionMeasures'


       if @@ROWCOUNT = 0
            Return 100      -- Table must be in SummaryTableLoadHistory

        if @maxLoaddate >= cast(getdate() as date)
            Return 200  -- do not load current date

        select 1
            from Summary.PortionMeasures
            where AsOfDate > @maxloaddate
        if @@ROWCOUNT > 0
            Return 300      -- date range already loaded
         



        insert into #tmprates (portionID, testdate)
                select 
	                b.PortionDBID,
                    cast(c.testdate as date) testdate
                from 
	            candidate.TestAssignmentPortions a join
	            test.Portion b on
		            a.TestPortionKey = b.PortionDBID  and
                    a.currentflag = 0 and b.currentflag = 0 join
                Candidate.TestAssignments c on
                    a.TestAssignKey = c.TestAssignmentDBID and
                    c.CurrentFlag = 0
                where
                   c.TestDate between @MinLoaddate and  @MaxLoaddate
                group by b.PortionDBID, cast(c.testdate as date);
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
            with passcount (testportionkey,  cnt) as
	                (select a.testportionkey,  count(*) cnt
	                from Candidate.TestAssignmentPortions a join
                         Candidate.TestAssignments b on
                            a.TestAssignKey = b.TestAssignmentDBID 
	                where  
                        cast(b.TestDate as date) between @refloadDate and @lastLoadDate
	                group by TestPortionKey )
                Update #tmprates 
                    set allN = cnt
                from 
                    #tmprates b join
                    passcount a  on
                    a.testportionkey = b.portionID and
                    b.testdate  = @lastLoadDate;
            -- Total first time  candidates
                 with passcount (testportionkey,  cnt) as
	                (select a.testportionkey,  count(*) cnt
	                from Candidate.TestAssignmentPortions a join
                         Candidate.TestAssignments b on
                            a.TestAssignKey = b.TestAssignmentDBID 
	                where  a.Take# = 1 and
                             cast(b.TestDate as date) between @refloadDate and  @lastLoadDate
	                group by TestPortionKey )
                Update #tmprates 
                    set allfirsttime = cnt
                from 
                    #tmprates b join
                    passcount a  on
                    a.testportionkey = b.portionID and
                    b.testdate  = @lastLoadDate;
            -- Total Passing

                with passcount (testportionkey, cnt) as
	                (select a.testportionkey, count(*) cnt
	                from Candidate.TestAssignmentPortions a join
                         Candidate.TestAssignments b on
                            a.TestAssignKey = b.TestAssignmentDBID 
	                where a.Result = 'Pass' and
                             cast(b.TestDate as date) between @refloadDate and  @lastLoadDate
	                group by TestPortionKey) 
                update #tmprates
                    set allpass = isnull(cnt,0)
                    from passcount a
                    where portionID = a.testportionkey and
                          testdate = @lastLoadDate;

            -- First Time pass
            with passcount (testportionkey, cnt) as
	            (select a.testportionkey, count(*) cnt
	            from Candidate.TestAssignmentPortions a join
                     Candidate.TestAssignments b on
                        a.TestAssignKey = b.TestAssignmentDBID 
	            where Result = 'Pass' and Take# = 1 and  b.TestDate between @refloaddate and  @lastLoadDate
	            group by TestPortionKey) 
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
        if datepart(month,@lastloaddate) = 1 and datepart(day,@lastloaddate) = 1
        begin
            select @minloaddate = @lastLoadDate,
                   @refloadDate = @lastloadDate
        end
    End

          begin try
            insert Summary.PortionMeasures(TestPortionKey, PortionName, 
                                        AllCandidateN, AllCandidatePass, AllCandidatePassRate, 
                                        FirstTimeN,FirstTimePass, FirstTimePassRate, AsOfDate )
            select distinct
                a.portionID,
                b.portionName,
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
            set MaxLoadDate = dateadd(day,1,@lastLoadDate),
                MinLoadDate = @lastloaddate,
                LoadRefDate = @refloadDate
             where TableName = 'Summary.PortionMeasures'
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