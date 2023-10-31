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
a.Studentkey, d.TestKey,  g.BankCategoryTitle, g.BankCategoryDescription,  	count(*) CatCount
from
dimensions.Studentlists_vw a ' +
'join
dimensions.StudentTestAttributes_vw m on
	a.StudentKey = m.StudentKey ' +
'join
Dimensions.StudentScores_vw b on
	a.Studentkey = b.StudentListKey ' +
'join
Dimensions.TestLists_vw c on
	b.TestListKey = c.TestListDbId ' +
'join
dimensions.Testsegments_vw d on
	c.TestKey = d.TestKey ' +
'join
Dimensions.TestQuestions_vw e on
	d.TestSegmentDBID = e.TestSegmentsKey ' +
'join
Dimensions.Questions_vw f on
	e.QuestionKey = f.QuestionDBID ' +
'	join
Dimensions.BankCategories_vw g on
	f.ContentsubAreaKey = g.BankCategoryDBID
where m.ExamPortionCode in (' + @ExamPortionCode + ') and m.ClientCode = ' + @ClientCode + '''' +
' and m.DateSched between ''' + cast(@fromdate as varchar(10)) + '''' + ' and ' + '''' + cast(@ToDate as varchar(10)) + '''' +
' group by a.Studentkey, d.TestKey,  g.BankCategoryTitle, g.BankCategoryDescription ' +
' order by g.BankCategoryTitle '
execute sp_executesql @sql
--select @sql

end
RETURN 0
