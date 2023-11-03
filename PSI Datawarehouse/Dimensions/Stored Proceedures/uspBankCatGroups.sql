CREATE PROCEDURE [Dimensions].[uspBankCatGroups]
	@ExamPortionCode nvarchar(100),
	@ClientCode nvarchar(10),
	@fromdate	date = '1/1/1900',
	@ToDate		date = '1/1/1900'
AS
	Begin
		declare @sql1 nvarchar(1000), @sql2 nvarchar(1000)
		if @ToDate = '1/1/1900'
			set @todate = getdate()
		if @fromdate = '1/1/1900'
			set @fromdate = '1/1/2021'
		if @ExamPortionCode = null
			return -1
		if @ClientCode = null
			return -2


set @sql1 = 
		'select 
a.Studentkey, d.TestKey,  l.BankCatGroupTitle, l.BankCatGroupDesc,  	count(*) BankCatCount
from
dimensions.StudentTestAttributes_vw a
join 
 dimensions.studentlists_vw b on 
	a.studentkey = b.studentkey
 join
Dimensions.StudentScores_vw c on
	b.studentlistdbid = c.studentlistkey 
 join
Dimensions.TestLists_vw d on
	c.TestListKey = d.testlistdbid 
 join
dimensions.Testsegments_vw e on
	d.TestKey = e.TestKey 
 join
Dimensions.TestQuestions_vw f on
	e.TestSegmentDBID = f.TestSegmentsKey 
 join
Dimensions.Questions_vw g on
	f.QuestionKey = g.QuestionDBID 
 join
Dimensions.BankCategoryGroups_vw l on 
	g.ContentAreaKey = l.BankCategoryGroupDBID 
where a.ExamPortionCode in ( ' + 
@ExamPortionCode + ') and a.ClientCode = ' + @ClientCode  + ' and a.DateSched between ' + 
'''' + cast(@fromdate as varchar(10)) + ''''+   ' and ' + '''' +cast(@ToDate as varchar(10)) + ''''  +
' Group by a.Studentkey, d.TestKey,  l.BankCatGroupDesc, l.BankCatGroupTitle
 Order by a.Studentkey, d.TestKey,  l.BankCatGroupTitle, l.BankCatGroupDesc '

execute sp_executesql @sql1
--select @sql1
end
RETURN 0
