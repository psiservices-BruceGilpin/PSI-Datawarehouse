CREATE PROCEDURE [Dimensions].[uspExamLevelResults]
	@ExamPortionCodes nvarchar(200),
	@ClientCode nvarchar(15),
	@fromDate date,
	@Todate date
AS
	Begin
		Declare @sql nvarchar(2000)

		set @sql = 
		N'select distinct
			a.StudentAltID PID
			, a.studentdbid
			, a.FirstName + '' '' +  isnull(rtrim(a.MadienName),'''') + '' '' + a.LastName studentname
			, b.ClientCode
			, b.ExamCode 
			, b.ExamPortionCode
			, b.ExternalTestCenterKey TestCenter
			, d.startdate
			, b.Degree
			, b.Licsense
			, d.PFA
			, h.Reapplicant
			, i.Recertification
			, d.FinalPoints
			, d.ScaledScore
		from 
			dimensions.Students a 
			join
				dimensions.StudentTestAttributes_vw  b on
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
			dimensions.testlists_vw f on
				d.testlistkey = f.testlistdbid
			join
			Dimensions.Tests_vw g on
				f.testkey = g.testdbid
			left join
			dimensions.ReapplicantTrue_vw h on
				d.StudentScoreDBID = h.StudentScoresKey
			left join
			Dimensions.RecertificationTrue_vw i on
				d.StudentScoreDBID = i.StudentScoresKey
			where 
			g.testclass = 1 and
			b.ExamPortionCode in (' + @ExamPortionCodes + ') and b.ClientCode = ' + @ClientCode + 
			' and cast(e.schedulestart as date) between ''' + cast(@fromdate as varchar(10)) + '''' + ' and ' + '''' + cast(@ToDate as varchar(10)) + '''' 

		execute sp_executesql @sql
--		select @sql
		
	end
RETURN 0
