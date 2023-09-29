CREATE PROCEDURE [Summary].[uspItemLevelMaintenance] 
    @AccountName varchar(100) 

AS 
    create table #itemResponse (
        PortionName    varchar(100),
        ItemDBKey   bigint,
        AsOfDate    date,
        Itemstatus int,
        nT int,
        nY int,
        Sigmax int,
        SigmaSQX bigint,
        Sigmay int )

    declare @minloaddate datetime, 
            @maxLoaddate date, 
            @refdate date,
            @newrows int, 
            @createdate datetime, 
            @lastLoadDate date, 
            @rwcnt int 
    
    Begin try 
    Select 
      @MaxLoadDate = MaxLoadDate, 
      @minloaddate = MinLoadDate,
      @refdate = LoadRefDate
    from 
      Logging.SummaryTableLoadHistory 
    where 
      TableName = 'Summary.ItemLevelMaintenance' if @@ROWCOUNT = 0 Return 100 -- Table must be in SummaryTableLoadHistory
      if @maxLoaddate >= cast(
        getdate() as date
      ) Return 200 -- do not load current date
    select 
     @rwcnt =  count(*) 
    from 
      Summary.ItemResponseAnalysis
    where 
      AsOfDate >= @minloaddate if @rwcnt > 0 Return 300 -- date range already loaded
      end try Begin catch Insert Logging.SQLErrors (
        ErrorLIne, ErrorMessage, ErrorNumber, 
        ErrorProcedure, ErrorSeverity, ErrorState, 
        ErrorDateTime
      ) 
    Values 
      (
        ERROR_LINE(), 
        ERROR_MESSAGE(), 
        ERROR_NUMBER(), 
        ERROR_PROCEDURE(), 
        ERROR_SEVERITY(), 
        ERROR_STATE(), 
        getdate()
      ) end catch 
    set 
      @lastLoadDate = @minloaddate 
      Insert into #itemResponse (PortionName, ItemDBKey, Itemstatus, AsOfDate)
        select distinct  c.portionName, b.ItemKey,  b.ItemPoolStatusKey, e.TestDate
        from
            test.FixedFormItem_vw a join
            test.ItemPool_vw b on
                a.itemKey = b.itemKey join
            test.Portion_vw c on
                b.PortionKey = c.PortionDBID join
            test.test_vw d on
                c.testkey = d.testdbid join
            Candidate.TestAssignments_vw e on
                d.TestDBID = e.TestKey join
            candidate.TestAssignmentPortions_vw ee on
                e.testassignmentdbid = ee.TestAssignKey and
                c.portiondbid = ee.TestPortionKey join
            account.Accounts f on
                f.AccountDBID = d.accountkey join
            Candidate.CandidateResponses_vw g on
                g.testAssignPortionKey = ee.TestAssignPortionDBId and
                g.itembankKey = b.itemKey
     
        where
            e.TestDate between @minloaddate and @maxLoaddate and
            f.AccountName = @AccountName and
             not exists (select * from dbo.MigratedTests g 
                            where g.AccountKey = f.AccountDBID and g.TestKey = d.testdbid)
      Begin Try 
        while @lastLoadDate <= @maxLoaddate
        begin


            with resultsummary (PortionName,Itemdbkey, testdate, itemstatus, nT, nY, SigmaX, SigmaSqX, Sigmay) as
            (
                select
                    b.portionname,
                    a.ItemKey,
                    d.testdate,
                    a.ItemPoolStatusKey,
                    count(*) nT,
                    sum(case when fff.Weightage >= 1 then 1 else 0 end) Ny,
                    sum(e.rawscore) sigmaX,
                    sum(square(e.rawscore)) Sigmasqx,
                    sum(case when fff.Weightage >= 1 then e.rawscore else 0 end) Sigmay
               
			   from 
				test.ItemPool_vw a join
				test.Portion_vw b on
				b.PortionDBId = a.PortionKey join
				test.Test_vw c on
					b.TestKey = c.TestDBID join
				Candidate.TestAssignments_vw d on
					c.TestDBID = d.TestKey join
				Candidate.TestAssignmentPortions_vw e on
					d.TestAssignmentDBId = e.TestAssignKey and
                    e.testportionkey = b.portiondbid join
				Candidate.CandidateResponses_vw f on
					e.TestAssignPortionDBId = f.TestAssignPortionKey   join
				Candidate.ResponseSelections ff on
					f.CandidateResponseDBId = ff.ResponseSelectionId join
				test.ItemOptions_vw fff on
					ff.ItemOptionKey = fff.ItemOptionsDBId join
                #itemResponse g on
                    g.PortionName = b.portionname and
                    g.ItemDBKey = a.itemkey and
                    g.AsOfDate = d.testdate and
                    g.Itemstatus = a.itempoolstatuskey
                where
                    d.TestDate  between @refdate and @lastLoadDate  
                group by
                    d.testdate, b.PortionName, a.ItemKey, a.ItemPoolStatusKey )

            Update #itemResponse 
                set nT = b.nT,
                    nY = b.nY,
                    Sigmax = b.SigmaX,
                    SigmaSQX = b.SigmaSQx,
                    sigmay = b.sigmay 
             from #itemResponse a join
                  resultsummary b on
                    a.PortionName = a.PortionName and
                    a.ItemDBKey = b.itemdbkey and
                    a.AsOfDate  = @lastLoadDate and
                    a.Itemstatus = b.itemstatus;

            set @lastLoadDate = dateadd(day,1,@lastloaddate)
         end
                    
            insert into summary.ItemResponseAnalysis (PortionName,ItemKey,AsofDate,ItemStatus,nT, SigmaX, SigmaSQX,SigmaY, nY)
            select distinct PortionName, ItemDbKey, AsOfDate,Itemstatus,nT,Sigmax, SigmaSQX, Sigmay, ny
            from #itemResponse
            where nT is not null


      --Update Logging.SummaryTableLoadHistory
      --   set MaxLoadDate = dateadd(day,1,@lastloaddate),
      --       MinLoadDate = @lastLoadDate
      --   where TableName = 'Summary.ItemLevelMaintenance'
     end try 
     Begin catch 
         Insert Logging.SQLErrors (
            ErrorLIne, ErrorMessage, ErrorNumber, 
            ErrorProcedure, ErrorSeverity, ErrorState, 
            ErrorDateTime
          ) 
        Values 
          (
            ERROR_LINE(), 
            ERROR_MESSAGE(), 
            ERROR_NUMBER(), 
            ERROR_PROCEDURE(), 
            ERROR_SEVERITY(), 
            ERROR_STATE(), 
            getdate()
          ) end catch 
  RETURN 0