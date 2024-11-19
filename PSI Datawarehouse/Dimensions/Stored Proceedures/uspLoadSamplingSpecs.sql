CREATE PROCEDURE [dimensions].[uspLoadSamplingSpecs]

AS
--Begin Try
--	Insert Dimensions.SamplingSpecifications 
--	(
--           [CurrentFlag]
--           ,[CheckSum]
--           ,[SourceSystemID]
--           ,[CreateDate]
--           ,[ResultKey]
--           ,[BankKey]
--           ,[Topic]
--           ,[SpecDescription]
--           ,[DateAdded]
--           ,[IsDeleted]
--           ,[LastUpdated]
--           ,[IsValid]
--           ,[IsPublished]
--           ,[BelowMeanTolerance]
--           ,[TargetMean]
--           ,[AboveMeanTolerance]
--           ,[BelowSDTolerance]
--           ,[BelowReliabilityTolerance]
--           ,[TargetReliability]
--           ,[AboveReliabilityTolerance]
--           ,[BelowCutScoreTolerance]
--           ,[TargetCutScore]
--           ,[AboveCutScoreTolerance]
--           ,[RawCut]
--           ,[SurvivingFormsMinimum]
--           ,[UseItemResponseTheory]
--           ,[BelowCSEMTolerance]
--           ,[TargetCSEMTolerance]
--           ,[AboceCSEMTolerance]
--           ,[IsAta]
--           ,[NumberOfDesiredForms]
--           ,[ScaleCut]
--	)
--    select
--        0
--        ,[checksum]
--        ,4
--        ,getdate()
--        ,res


--    from
--    dw_summarytables.dbo.LXRSamplingSpecs


--end
--	Begin catch
--		Insert Logging.SQLErrors (
--			ErrorLIne,
--			ErrorMessage,
--			ErrorNumber,
--			ErrorProcedure,
--			ErrorSeverity,
--			ErrorState,
--			ErrorDateTime )
--		Values (
--			ERROR_LINE(),
--			ERROR_MESSAGE(),
--			ERROR_NUMBER(),
--			ERROR_PROCEDURE(),
--			ERROR_SEVERITY(),
--			ERROR_STATE(),
--			getdate() )
--	end catch
RETURN 0
