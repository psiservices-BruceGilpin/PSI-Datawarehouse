CREATE PROCEDURE [Dimensions].[uspExamCategorieGroupCount]
	@ExamPortionCode nvarchar(100),
	@ClientCode nvarchar(10),
	@fromdate	date = '1/1/1900',
	@ToDate		date = '1/1/1900'
AS
	Begin
		create table #BankCategories (StudentKey int, Testkey int, BankCatGroupTitle nvarchar(100), BankCatGroupDesc nvarchar(500), BankCatCont int)
		create table #BankGroups (StudentKey int, Testkey int, BankGroupTitle nvarchar(100), BankGroupDesc	nvarchar(500), BankGroupCount int)

		declare @sql nvarchar(2000)

		insert into #BankCategories (StudentKey, Testkey, BankCatGroupTitle, BankCatGroupDesc, BankCatCont)
		exec Dimensions.uspBankCategories
			@examportioncode,
			@clientcode,
			@fromdate,
			@todate


	   insert into #BankGroups (StudentKey, Testkey, BankGroupTitle, BankGroupDesc, BankGroupCount )
	   		exec Dimensions.uspBankCatGroups
			@examportioncode,
			@clientcode,
			@fromdate,
			@todate



		
		
		select
			a.StudentDBID, f.TestKey
		from 
		dimensions.Students a 
		join
		dimensions.StudentTestAttributes_vw b on
			a.studentdbid = b.studentkey
		join
		dimensions.studentlists_vw c on
			a.studentdbid = c.studentkey 
		join
		dimensions.StudentScores d on
			c.studentlistdbid = d.studentlistkey
		join
		dimensions.TestSchedules_vw e on
			d.TestScheduleKey = e.TestScheduleDBID and
			b.datesched between cast(e.schedulestart as date) and cast(e.scheduleEnd as date)
		join
		dimensions.testlists f on
			d.testlistkey = f.testlistdbid
		left join
			#BankCategories g on
				f.testdbid = g.testkey and 
				a.studentdbid = k.studentkey
		left join
		#BankGroups h on
			g.testdbid = h.testkey and
			a.studentdbid = h.studentkey



	End
RETURN 0
