CREATE PROCEDURE [dbo].[uspItemAccountXrefMaint]

AS
    Declare @rowcount  int = 0
	Begin Try
        Merge Test.ItemAccountXRef as tgt
        Using (
            select distinct e.AccountKey, a.ItemBankDBID
            from
            test.ItemBank a join 
            test.FixedFormItem b on
	            a.ItemBankDBID = b.ItemKey and
	            b.CurrentFlag = 0 join
            test.FixedForm c on
	            b.FixedFormKey = c.FixedFormDBID and
	            c.CurrentFlag = 0 join
            test.Portion d on
	            d.PortionDBID = c.PortionKey  and 
	            d.CurrentFlag = 0 join
            test.Tests e on
	            e.TestDBKey = d.TestKey and
	            e.CurrentFlag = 0
            where a.CurrentFlag = 0 ) as src (AccountKey, ItemDBID) on
                src.AccountKey = tgt.AccountKey and
                src.ItemDBId   = tgt.ItemKey
        When Not Matched then
            Insert (AccountKey, ItemKey)
            Values (src.AccountKey, Src.ItemDBID);
        set @rowcount = @@ROWCOUNT
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


RETURN @rowcount