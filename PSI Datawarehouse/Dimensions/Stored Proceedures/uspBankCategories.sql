CREATE PROCEDURE [Dimensions].[uspBankCategories]
	@ExamPortionCode nvarchar(100),
	@ClientCode nvarchar(10),
	@fromdate	date = '1/1/1900',
	@ToDate		date = '1/1/1900'
AS
	Begin
		Declare @sql nvarchar(1000)
		Set @sql =
		'select 
a.Studentkey, d.TestKey,  h.BankCategoryTitle, h.BankCategoryDescription,  	count(*) CatCount
from
dimensions.StudentTestAttributes_vw a
join 
 dimensions.studentlists_vw b on 
	a.studentkey = b.studentkey
join
Dimensions.StudentScores_vw c on
	b.studentlistdbid = c.studentlistkey ' +
'join
Dimensions.TestLists_vw d on
	c.TestListKey = d.testlistdbid ' +
'join
dimensions.Testsegments_vw e on
	d.TestKey = e.TestKey ' +
'join
Dimensions.TestQuestions_vw f on
	e.TestSegmentDBID = f.TestSegmentsKey ' +
'join
Dimensions.Questions_vw g on
	f.QuestionKey = g.QuestionDBID ' +
'	join
Dimensions.BankCategories_vw h on
	g.ContentsubAreaKey = h.BankCategoryDBID
where a.ExamPortionCode in (' + @ExamPortionCode + ') and a.ClientCode = ' + @ClientCode + 
' and a.DateSched between ''' + cast(@fromdate as varchar(10)) + '''' + ' and ' + '''' + cast(@ToDate as varchar(10)) + '''' +
' group by a.Studentkey, d.TestKey,  h.BankCategoryTitle, h.BankCategoryDescription ' +
' order by a.Studentkey, d.Testkey, h.BankCategoryTitle '
execute sp_executesql @sql
--select @sql

end
RETURN 0
