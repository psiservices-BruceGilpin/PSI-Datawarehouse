CREATE PROCEDURE [dbo].[ExamHistoryBackfill]
	@startdate date,
	@enddate date
AS

		exec uspExamStepProcessing_Backfill @startdate, @enddate
		exec uspExamNotesProcessing_Backfill @startdate, @enddate
	
RETURN 0