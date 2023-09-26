CREATE PROCEDURE [Summary].[USPPortionFormMeasures]

AS
	--create table #PortionForms (
 --       PortionKey bigint not null,
 --       FormKey    bigint not null,
 --       AsOfDate   date not null,
 --       PassingScore int not null,
 --       ItemCount int not null,
 --       NumberOfCandidates int,
 --       MeanRawScore Decimal(10,3),
 --       RawScoreSD   Decimal(10,3),
 --       ReliabilityEstimate Decimal(10,3),
 --       ReliabilityVariance Decimal(10,3) )

 --       Declare @LastLoadDate date, @minloaddate date, @LoopDate date

 --        Begin try
 --           Select  @lastLoadDate = MaxLoadDate,
 --                   @MinLoadDate = MinLoadDate
 --           from Logging.SummaryTableLoadHistory
 --           where TableName = 'Summary.USPPortionFormMeasures'
 --       if @@ROWCOUNT = 0
 --           Return 100     
 --       select @rwcnt = count(*)
 --       from Summary.PassRates 
 --       if @rwcnt > 0
 --           Begin
 --               Select @rwcnt = count(*)
 --               from Summary.PassRates
 --               where AsOfDate >= @lastLoadDate
 --               if @rwcnt = 0 or @rwcnt is null
 --                   Return 200
 --           End
 --       Insert into #PortionForms (PortionKey, FormKey, AsOfDate, PassingScore, ItemCount)
 --       Select  a.PortionKey, a.FormDBID, cast(a.DateGenerated as date), a.PassingScore, count(*)
 --       from test.FixedForm a join
 --            test.FixedFormItem b on
 --               a.FixedFormDBID = b.FixedFormKey
 --       where a.DateGenerated between @minloaddate and @maxLoadDate
 --       group by a.PortionKey, a.FormDBID, cast(a.DateGenerated as date), a.PassingScore
 --       set @LoopDate = @minloaddate


RETURN 0