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
'select a.Studentkey, d.TestKey,  l.BankCatGroupTitle, l.BankCatGroupDesc,  	count(*) BankCatCount ' +
'from
dimensions.Studentlists_vw a ' +
'join ' +
'dimensions.StudentTestAttributes_vw m on ' +
	'a.StudentKey = m.StudentKey '+
'join ' +
'Dimensions.StudentScores_vw b on ' +
	'a.Studentkey = b.StudentListKey ' + 
'join ' +
'Dimensions.TestLists_vw c on ' +
'	b.TestListKey = c.TestListDbId ' +
'join '+
'dimensions.Testsegments_vw d on ' +
'	c.TestKey = d.TestKey ' +
' join ' +
'Dimensions.TestQuestions_vw e on ' +
	' d.TestSegmentDBID = e.TestSegmentsKey ' +
' join ' +
'Dimensions.Questions_vw f on ' +
'	e.QuestionKey = f.QuestionDBID ' +
'	join ' +
'Dimensions.BankCategoryGroups_vw l on '+
'	f.ContentAreaKey = l.BankCategoryGroupDBID ' +
'where m.ExamPortionCode in ( ' +
@ExamPortionCode + ') and m.ClientCode = ' + @ClientCode  + ' and m.DateSched between ' + '''' + cast(@fromdate as varchar(10)) + ''''+   ' and ' + '''' +cast(@ToDate as varchar(10)) + ''''  +
' Group by a.Studentkey, d.TestKey,  l.BankCatGroupTitle, l.BankCatGroupDesc' +
' Order by l.BankCatGroupTitle '

execute sp_executesql @sql1
--select @sql1
end
RETURN 0
