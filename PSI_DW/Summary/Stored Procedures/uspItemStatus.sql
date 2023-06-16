CREATE PROC [Summary].[uspItemStatus]
	@Rundate date
AS
BEGIN
	create table #Itemstatus (
	AccountDBID int,
	TestDbKey	int,
	PortionDBID int,
	ItemKey		int,
	active		tinyint,
	Experimental		tinyint,
	OnHold		tinyint,
	Deact		tinyint)

    declare @rowcount int

    Begin try

        select @rowcount = count(*) from Summary.ItemStatusByAccountTest where AsOfDate = @Rundate

        If @rowcount = 0
        Begin
            insert into #Itemstatus
	           select
		         a.AccountDBID
		        ,b.TestDBKey
		        ,c.PortionDBID
		        ,g.ItemKey
		        ,case when h.sourcsystemstatuskey = 'TIS01' then 1 else 0 end Active
		        ,case when h.sourcsystemstatuskey = 'TIS02' then 1 else 0 end Experimental
		        ,case when h.sourcsystemstatuskey = 'TIS03' then 1 else 0 end OnHold
		        ,case when h.sourcsystemstatuskey = 'TIS04' then 1 else 0 end Deact	
               from 
                Account.Accounts a join
                test.Tests b on
	                a.AccountDBID = b.AccountKey and
	                b.CurrentFlag = 0 join
                test.Portion c on 
                 b.TestDBKey = c.TestKey and
                 c.currentflag = 0 join
                test.ItemPool g  on
	                c.PortionDBID = g.PortionKey and
	                g.CurentFlag = 0 join
                test.ItemPoolStatus h on
	                g.ItemPoolStatusKey = h.ItemPoolStatusId 
                where 
                    a.CurrentFlag = 0
            Insert into Summary.ItemStatusByAccountTest
                (AsOfDate, AccountKey, TestKey,PortionKey,Active,Experimental,OnHold,Deactivate)
                select 
                    @Rundate,
                    AccountDBID,
                    TestDbKey,
                    PortionDBID,
                    Sum(Active),
                    sum(experimental),
                    sum(Onhold),
                    sum(Deact)
                From #Itemstatus
                Group by
                    AccountDBID,
                    TestDbKey,
                    PortionDBID
           End
           Else
           Begin
            Insert Logging.SQLErrors ( Errorline, ErrorMessage, ErrorProcedure, ErrorDateTime)
                Values (
                   19,  'Rows already exist in ItemStatusByAccountTest for AsOfDate ' + cast(@rundate as varchar(20)), 'uspItemStatus', getdate() )
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
 

END