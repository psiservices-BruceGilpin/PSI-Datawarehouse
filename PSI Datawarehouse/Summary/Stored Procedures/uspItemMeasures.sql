CREATE PROCEDURE [Summary].[uspItemMeasures]

AS
	    declare @minloaddate datetime, @maxLoaddate datetime, @newrows int, @createdate datetime
	--Begin try
 --       Select  @maxLoaddate = MaxLoadDate
 --       from Logging.SummaryTableLoadHistory
 --       where TableName = 'Summary.ItemMeasures'
 --   if @@ROWCOUNT = 0
 --       Return 100
 --   Select @newrows = count(*) from
 --    Test.ItemBank a join
 --    Test.FixedFormItem b on
 --       a.ItemBankDBID = b.ItemKey and
 --       a.CurrentFlag = 0 and
 --       b.CurrentFlag = 0
 --   where 
 --       CreatedDate > @maxLoaddate 
 --   if @newrows = 0
 --       Return 110
 --   End Try
 --   Begin catch
	--	Insert Logging.SQLErrors (
	--		ErrorLIne,
	--		ErrorMessage,
	--		ErrorNumber,
	--		ErrorProcedure,
	--		ErrorSeverity,
	--		ErrorState,
	--		ErrorDateTime )
	--	Values (
	--		ERROR_LINE(),
	--		ERROR_MESSAGE(),
	--		ERROR_NUMBER(),
	--		ERROR_PROCEDURE(),
	--		ERROR_SEVERITY(),
	--		ERROR_STATE(),
	--		getdate() )
	--end catch

RETURN 0