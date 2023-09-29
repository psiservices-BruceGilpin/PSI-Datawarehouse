CREATE PROCEDURE [Summary].[uspScoreMeansReliablityMaint]
	@quaterstart date,
    @SourceSystem smallint

AS
    declare @qtrStart date, @qtrEnd date, @rowcnt int

    if @quaterstart is not null
    begin
        begin try
	        select @qtrstart = qtrstart, @qtrEnd = @qtrEnd from
             QuarterlyCalendar_vw where
              qtrstart = @quaterstart
             if @@ROWCOUNT = 0                              -- only accept quarter starting dates
                Return 100
             if @qtrend < getdate()                         -- only process complete quarters
                Return 200
             select @rowcnt = count(*)                      -- do not process quarters already processed
             from summary.PortionQuarterlyReliability
             where QuarterStart >= @quaterstart
             if @rowcnt > 0
                Return 300
      
             Insert into [Summary].[PortionQuarterlyReliability] 
                ( SourceSystemKey, Portionkey, QuarterStart,  PassingScore, Itemcount, nT,  MeanRawscore, STDRawScore ,ReliabilityEstimate)
                select
                    @sourceSystem,
	                a.TestAssignPortionDBId,
                    @qtrStart,
	                f.PassingScore,
	                f.itemcount,
                    count(*) nT,
	                avg(a.rawscore) MeanRawScore,
	                stdev(a.rawscore) StdDevRawScore,
	                case when var(a.Rawscore) > 0 then
		                round((f.itemcount) /(f.itemcount-1)*(1-(avg(a.rawscore) * (f.itemcount-(avg(a.rawscore))))/(f.itemcount * Var(a.rawscore))), 2) 
		                else 0
	                end as 'Reliability Estimate'
                from Candidate.TestAssignmentPortions_vw a join
	                 test.fixedform_vw b on
		                a.TestPortionKey = b.PortionKey  join
	                 Candidate.TestAssignments_vw d on
		                a.TestAssignKey = d.TestAssignmentDBId join
	                 QuarterlyCalendar_vw e on
		                d.TestDate between e.qtrStart and e.qtrEnd and
                        e.qtrStart = @qtrStart join
                     test.portion_vw f on
                        b.portionkey = f.Portiondbid
                where  f.ItemCount > 1  and a.rawscore > 0
                group by
	                a.TestAssignPortionDBId,
	                f.PassingScore,
	                f.itemcount
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
	        end catch
        end
RETURN @@rowcount