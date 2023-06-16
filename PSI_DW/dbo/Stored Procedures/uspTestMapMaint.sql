CREATE PROCEDURE [dbo].[uspTestMapMaint]

AS
	create table #testmap (
	Testkey bigint,
	Portionkey bigint,
	FixedFormkey bigint,
	ItemKey bigint,
	Minstart date,
	Maxstart date );

    Truncate table Test.TestMap
    Begin Try
        with testmap as
	 (
		Select b.testkey, a.TestPortionKey portionkey, min(cast(a.starttime as date)) minstart, max(cast(a.starttime as date)) maxstart
		From Candidate.TestAssignmentPortions  a join
			 Candidate.TestAssignments b on
				a.TestAssignKey = b.TestAssignmentDBID and
                a.CurrentFlag = 0 and b.CurrentFlag = 0
		where a.StartTime is not null and a.StartTime > '1/1/1900'	 
		    group by b.testkey, a.TestPortionKey
     ) 
     insert into #testmap (
    TestKey, PortionKey,  Minstart, Maxstart, FixedFormkey, ItemKey )
    select a.testkey, a.portionkey, a.minstart, a.maxstart, b.FixedFormDBID, c.ItemKey
    from testmap a join
	    test.FixedForm b on
		    a.portionkey = b.PortionKey and
            b.currentflag = 0 join
	    test.FixedFormItem c on
		    b.FixedFormDBID = c.FixedFormKey and
            b.CurrentFlag = 0
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
        Insert into test.TestMap
            (TestKey, PortionKey, FixedFormKey, ItemKey, StartDate, EndDate)
        Select TestKey, PortionKey, FixedFormKey, ItemKey, Minstart, Maxstart
        from #testmap
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