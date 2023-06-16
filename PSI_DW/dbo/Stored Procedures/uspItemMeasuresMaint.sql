CREATE PROCEDURE [dbo].[uspItemMeasuresMaint]
as
    create table #ItemMeasures (
	    TestKey bigint,
	    PortionKey bigint,
	    ItemKey	bigint,
	    TopicKey bigint,
	    PTAID bigint,
	    SampleGroupKey	bigint,
	    Stem varchar(5000),
	    ItemStatus varchar(50),
	    AngoffValue decimal(9,4),
	    Pvalue decimal(9,4),
	    Pbis	decimal(9,4),
	    chksum bigint)
    declare @minloaddate datetime, @maxLoaddate datetime, @newrows int, @createdate datetime
	Begin try
        Select  @maxLoaddate = MaxLoadDate
        from Logging.SummaryTableLoadHistory
        where TableName = 'Summary.ItemMeasures'
    if @@ROWCOUNT = 0
        Return 100
    Select @newrows = count(*) from
     test.FixedFormItem where
    CreatedDate > @maxLoaddate 
    if @newrows = 0
        Return 110

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


    Begin Try
    	    Insert into #ItemMeasures
	            (TestKey, PortionKey, AngoffValue, Pvalue, Pbis, ItemKey, ItemStatus)
	        select a.TestDBKey, b.PortionDBID,  c.AngoffValue, c.Pvalue, c.Pbis, c.ItemKey, d.StatusState
	        from test.Tests a join
		        test.Portion b on
			        a.TestDBKey = b.TestKey join
		        test.ItemPool c on
			        b.PortionDBID = c.PortionKey left join
		        test.ItemPoolStatus d on
			        c.ItemPoolStatusKey = d.ItemPoolStatusId
	        where a.CurrentFlag = 0 and b.CurrentFlag = 0 and c.CurentFlag = 0
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
        Return -1
	end catch
    Begin Try
        Update #ItemMeasures 
		    set TopicKey = b.PortionTopicAreaDBID,
			    PTAID = b.PortionTopicAreaDBID
	    from
		    #ItemMeasures a join
		    Test.PortionTopicArea b on
			    a.PortionKey = b.PortionKey and
			    b.CurrentFlag = 0

	    Update #ItemMeasures
		    set SampleGroupKey = b.SampleGroupDBID
	    from
		    #ItemMeasures a join
		    test.TopicAreaSampleGroup b on
			    a.PTAID = b.TopicAreaKey and
			    b.CurrentFlag = 0

	    Update #ItemMeasures
		    set Stem = b.stem
	    from 
		    #ItemMeasures a join
		    test.ItemBank b on
			    a.ItemKey = b.ItemBankDBID and
                b.CurrentFlag = 0

	    Update #ItemMeasures
		    set chksum = CHECKSUM(ItemStatus, AngoffValue, Pvalue, Pbis, stem)
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
        return -2
	end catch
    Begin Try
        
        insert Summary.ItemMeasures
        ( TestKey, PortionKey, Itemkey, TopicKey,
          SampleGroupKey, ItemStatus, AngoffValue, Pvalue, Pbis,  chksum, effectivefrom, effectiveTo)
    select
         TestKey, PortionKey, Itemkey, topickey,
         SampleGroupkey, ItemStatus, AngoffValue, Pvalue, Pbis,  chksum, getdate(), '2999/12/31' 
    from
         #ItemMeasures  
    where not exists
        (select * from Summary.ItemMeasures
         where TestKey = #ItemMeasures.TestKey and
               PortionKey = #ItemMeasures.PortionKey and
               Itemkey = #ItemMeasures.ItemKey and
               chksum = #ItemMeasures.chksum)
    Merge Summary.ItemMeasures as tgt
    using
     (Select TestKey, PortionKey, ItemKey, SampleGroupKey, ItemStatus, AngoffValue, Pvalue, Pbis, chksum from #Itemmeasures) as src 
                                         ( TestKey, PortionKey, ItemKey, SampleGroupKey, ItemStatus, AngoffValue, Pvalue, Pbis, chksum) on
        tgt.TestKey    = src.TestKey and
        tgt.PortionKey = src.PortionKey and
        tgt.ItemKey    = src.ItemKey and
        tgt.chksum     <> src.chksum
    When matched then
        Update 
            set tgt.effectiveto = getdate();
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