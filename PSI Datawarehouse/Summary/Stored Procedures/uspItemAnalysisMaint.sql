CREATE PROCEDURE [Summary].[uspItemAnalysisMaint]

AS
--    CREATE TABLE #ItemAnalysis
--    (
--        [ItemKey] BigInt Not Null,
--        [AsOfDate] DATE NOT NULL, 
--        [ItemStatus] int,
--        [NumberOfCandidates] INT NULL, 
--        [nT] DECIMAL(10, 3) NULL, 
--        [nY] DECIMAL(10, 3) NULL, 
--        [SigmaX] DECIMAL(18, 3) NULL, 
--        [SigmaSqX] DECIMAL(10, 3) NULL, 
--        [SigmaY] DECIMAL(10, 3) NULL, 
--        [AvgTimeElapsed] INT NULL, 
--        [MinElapsed] NCHAR(10) NULL, 
--        [Feedback] BIT NULL 
--    )
--    Declare @MaxLoadDate date, @MinLoadDate date, @LoadRangeDate date
--    Begin try
--        Select  @MaxLoadDate = MaxLoadDate,
--                @minloaddate = MinLoadDate
--        from Logging.SummaryTableLoadHistory
--        where TableName = 'Summary.ItemAnalysis'


--        if @@ROWCOUNT = 0
--            Return 100      -- Table must be in SummaryTableLoadHistory

--        if @maxLoaddate >= cast(getdate() as date)
--            Return 200  -- do not load current date

--        select 1
--            from Summary.ItemAnalysis
--            where AsOfDate >= @minloaddate
--        if @@ROWCOUNT > 0
--            Return 300      -- date range already loaded
--        select @LoadRangeDate = @MinLoadDate
--        while @LoadRangeDate <= @MaxLoadDate
--        Begin
--            Insert #ItemAnalysis
--                (ItemKey, AsofDate,ItemStatus)
--            Select
--                a.ItemBankDBID, @LoadRangeDate, g.ItemPoolStatusKey
--            From
--                Test.ItemBank a join
--                Test.FixedFormItem b on
--                    a.ItemBankDBID = b.ItemKey and
--                    a.CurrentFlag = 0 and b.CurrentFlag = 0 join
--                test.FixedForm c on
--                    b.FixedFormKey = c.FixedFormDBID and
--                    c.CurrentFlag = 0 join
--                test.Portion d on
--                    c.PortionKey = d.PortionDBID and
--                    d.CurrentFlag = 0 join
--                test.Tests e on
--                    d.TestKey = e.TestDBKey join
--                Candidate.TestAssignments f on
--                    e.TestDBKey = f.TestKey and
--                    f.CurrentFlag = 0   join
--                test.ItemPool g on
--                    a.ItemBankDBID = g.ItemKey
--             Where cast(f.TestDate as date) = @LoadRangeDate
--             set @LoadRangeDate = dateadd(day,1,@loadrangedate)
--        End
--    End Try
--    Begin catch
--		    Insert Logging.SQLErrors (
--			    ErrorLIne,
--			    ErrorMessage,
--			    ErrorNumber,
--			    ErrorProcedure,
--			    ErrorSeverity,
--			    ErrorState,
--			    ErrorDateTime )
--		    Values (
--			    ERROR_LINE(),
--			    ERROR_MESSAGE(),
--			    ERROR_NUMBER(),
--			    ERROR_PROCEDURE(),
--			    ERROR_SEVERITY(),
--			    ERROR_STATE(),
--			    getdate() )
--	 end catch
     
--     Begin try
--        set @LoadRangeDate = @MinLoadDate
--        while @LoadRangeDate <= @MaxLoadDate
--        begin
--            update #ItemAnalysis
--            Set 
--                TimeElapsed = Avg(





         
RETURN 0