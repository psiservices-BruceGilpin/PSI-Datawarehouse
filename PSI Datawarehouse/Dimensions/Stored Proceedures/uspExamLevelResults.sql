CREATE PROCEDURE [Dimensions].[uspExamLevelResults]
	@ExamPortionCodes nvarchar(200),
	@ClientCode nvarchar(15),
	@fromDate date,
	@Todate date
AS
	Begin
		create table #BankCategories (StudentKey int, Testkey int, BankCatGroupTitle nvarchar(100), BankCatGroupDesc nvarchar(500), BankCatCont int)
		create table #BankGroups (StudentKey int, Testkey int, BankGroupTitle nvarchar(100), BankGroupDesc	nvarchar(500), BankGroupCount int)

		insert into #BankCategories (StudentKey, Testkey, BankCatGroupTitle, BankCatGroupDesc, BankCatCont)
		exec Dimensions.uspBankCategories
			@examportioncodes,
			@clientcode,
			@fromdate,
			@todate

	   insert into #BankGroups (StudentKey, Testkey, BankGroupTitle, BankGroupDesc, BankGroupCount )
	   		exec Dimensions.uspBankCatGroups
			@examportioncodes,
			@clientcode,
			@fromdate,
			@todate




	end
RETURN 0
