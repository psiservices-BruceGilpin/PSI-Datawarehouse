CREATE PROCEDURE [dbo].[uspSessionStepDurationMaint]
	@DurationName varchar(50),
    @SectionType smallint,
	@StartDate date, 
	@Enddate date = '2999/12/31'

AS
    If @sectiontype is null return -1
    if @SectionType not between 1 and 4 return -2
    If @DurationName is null return -3

    if @SectionType = 1     -- Earliest start step to earlist complete step
    begin
        Begin Try
	         with SectionDef (
          TestSessionID, 
	      DurationDefID,
          startstep, 
	      endstep
        ) as (
          select 
            a.TestSessionID, 
            a.DurationDefId,
            startstep, 
            b.endstep 
          from 
            (
              select 

                a.TestSessionId, 
                b.DurationDefId,
                min(a.steporder) startstep 
              from 
                bridge.vwTestSessions_NoNotes a 
                join [dbo].[DimDurationDefinitions] b on a.OrganizationId = b.OrganizationKey 
                join DimExamSteps c on b.StartStepKey = c.ExamStepId 
                and a.StepName = c.StepName 
              where 
                b.DurationName = @DurationName 
			    and b.EffectiveTo = '2999/12/31'
			    and b.OrganizationKey = a.OrganizationId
                and a.TestDate between @StartDate
                and @Enddate
              group by 
                b.DurationDefId,
                a.TestSessionId
            ) a 
            join (
              select 
                a.TestSessionId, 
                min(a.steporder) endstep 
              from 
                bridge.vwTestSessions_NoNotes a 
                join [dbo].[DimDurationDefinitions] b on a.OrganizationId = b.OrganizationKey 
                join DimExamSteps c on b.CompleteStepKey = c.ExamStepId 
                and a.StepName = c.StepName 
              where 
                b.DurationName = @DurationName 
			    and b.EffectiveTo = '2999/12/31'
			    and b.OrganizationKey = a.OrganizationId
                and a.TestDate between @StartDate 
                and @Enddate
              group by 
                a.TestSessionId
            ) b on a.testsessionID = b.testsessionID
         
          where 
            endstep > startstep
        ) 
        Insert into Reporting.SectionDurations
            (DurationDefKey, TestSessionKey, StartStep,EndStep,Duration, DurationType )
        Select 
          SectionDef.DurationDefID, 
          SectionDef.TestSessionID,
          sectiondef.startstep, 
          sectiondef.endstep, 
          Sum(b.StepDuration) sectionduration,
          @sectionType
        from 
          SectionDef 
          join Bridge.vwTestSessions_NoNotes b on SectionDef.TestSessionID = b.TestSessionId
          and StepOrder between SectionDef.startstep 
          and SectionDef.endstep 
        group by 
          SectionDef.TestSessionID, 
          SectionDef.DurationDefID, 
          sectiondef.startstep, 
          sectiondef.endstep;
        end try
        	Begin catch
		Insert Logging.SQLErrors (
			ErrorLIne,
			ErrorMessage,
			ErrorNumber,
			ErrorProcedure,
			ErrorSeverity,
			ErrorState,
			ErrorDateTime )
		Values (
			ERROR_LINE(),
			ERROR_MESSAGE(),
			ERROR_NUMBER(),
			ERROR_PROCEDURE(),
			ERROR_SEVERITY(),
			ERROR_STATE(),
			getdate() )
	end catch
    end
    else if  @sectiontype = 2           -- Earliest Start Step to Latest Complete Step
    begin
        begin try
	         with SectionDef (
          TestSessionID, 
	      DurationDefID,
          startstep, 
	      endstep
        ) as (
          select 
            a.TestSessionID, 
            a.DurationDefId,
            startstep, 
            b.endstep 
          from 
            (
              select 

                a.TestSessionId, 
                b.DurationDefId,
                min(a.steporder) startstep 
              from 
                bridge.vwTestSessions_NoNotes a 
                join [dbo].[DimDurationDefinitions] b on a.OrganizationId = b.OrganizationKey 
                join DimExamSteps c on b.StartStepKey = c.ExamStepId 
                and a.StepName = c.StepName 
              where 
                b.DurationName = @DurationName 
			    and b.EffectiveTo = '2999/12/31'
			    and b.OrganizationKey = a.OrganizationId
                and a.TestDate between @StartDate
                and @Enddate
              group by 
                b.DurationDefId,
                a.TestSessionId
            ) a 
            join (
              select 
                a.TestSessionId, 
                max(a.steporder) endstep 
              from 
                bridge.vwTestSessions_NoNotes a 
                join [dbo].[DimDurationDefinitions] b on a.OrganizationId = b.OrganizationKey 
                join DimExamSteps c on b.CompleteStepKey = c.ExamStepId 
                and a.StepName = c.StepName 
              where 
                b.DurationName = @DurationName 
			    and b.EffectiveTo = '2999/12/31'
			    and b.OrganizationKey = a.OrganizationId
                and a.TestDate between @StartDate 
                and @Enddate
              group by 
                a.TestSessionId
            ) b on a.testsessionID = b.testsessionID
         
          where 
            endstep > startstep
        ) 
        Insert into Reporting.SectionDurations
            (DurationDefKey, TestSessionKey, StartStep,EndStep,Duration, DurationType )
        Select 
          SectionDef.DurationDefID, 
          SectionDef.TestSessionID,
          sectiondef.startstep, 
          sectiondef.endstep, 
          Sum(b.StepDuration),
          @sectionType
        from 
          SectionDef 
          join Bridge.vwTestSessions_NoNotes b on SectionDef.TestSessionID = b.TestSessionId
          and StepOrder between SectionDef.startstep 
          and SectionDef.endstep 
        group by 
          SectionDef.TestSessionID, 
          SectionDef.DurationDefID, 
          sectiondef.startstep, 
          sectiondef.endstep;
        end try
        Begin catch
	    Insert Logging.SQLErrors (
		    ErrorLIne,
		    ErrorMessage,
		    ErrorNumber,
		    ErrorProcedure,
		    ErrorSeverity,
		    ErrorState,
		    ErrorDateTime )
	    Values (
		    ERROR_LINE(),
		    ERROR_MESSAGE(),
		    ERROR_NUMBER(),
		    ERROR_PROCEDURE(),
		    ERROR_SEVERITY(),
		    ERROR_STATE(),
		    getdate() )
        end catch
    end
    else if  @sectiontype = 3           -- Latest Start Step to Earlest Complete Step
    begin
        begin try
	         with SectionDef (
          TestSessionID, 
	      DurationDefID,
          startstep, 
	      endstep
        ) as (
          select 
            a.TestSessionID, 
            a.DurationDefId,
            startstep, 
            b.endstep 
          from 
            (
              select 

                a.TestSessionId, 
                b.DurationDefId,
                max(a.steporder) startstep 
              from 
                bridge.vwTestSessions_NoNotes a 
                join [dbo].[DimDurationDefinitions] b on a.OrganizationId = b.OrganizationKey 
                join DimExamSteps c on b.StartStepKey = c.ExamStepId 
                and a.StepName = c.StepName 
              where 
                b.DurationName = @DurationName 
			    and b.EffectiveTo = '2999/12/31'
			    and b.OrganizationKey = a.OrganizationId
                and a.TestDate between @StartDate
                and @Enddate
              group by 
                b.DurationDefId,
                a.TestSessionId
            ) a 
            join (
              select 
                a.TestSessionId, 
                min(a.steporder) endstep 
              from 
                bridge.vwTestSessions_NoNotes a 
                join [dbo].[DimDurationDefinitions] b on a.OrganizationId = b.OrganizationKey 
                join DimExamSteps c on b.CompleteStepKey = c.ExamStepId 
                and a.StepName = c.StepName 
              where 
                b.DurationName = @DurationName 
			    and b.EffectiveTo = '2999/12/31'
			    and b.OrganizationKey = a.OrganizationId
                and a.TestDate between @StartDate 
                and @Enddate
              group by 
                a.TestSessionId
            ) b on a.testsessionID = b.testsessionID
         
          where 
            endstep > startstep
        ) 
        Insert into Reporting.SectionDurations
            (DurationDefKey, TestSessionKey, StartStep,EndStep,Duration, DurationType )
        Select 
          SectionDef.DurationDefID, 
          SectionDef.TestSessionID,
          sectiondef.startstep, 
          sectiondef.endstep, 
          Sum(b.StepDuration),
          @SectionType
        from 
          SectionDef 
          join Bridge.vwTestSessions_NoNotes b on SectionDef.TestSessionID = b.TestSessionId
          and StepOrder between SectionDef.startstep 
          and SectionDef.endstep 
        group by 
          SectionDef.TestSessionID, 
          SectionDef.DurationDefID, 
          sectiondef.startstep, 
          sectiondef.endstep;
        end try
        Begin catch
	    Insert Logging.SQLErrors (
		    ErrorLIne,
		    ErrorMessage,
		    ErrorNumber,
		    ErrorProcedure,
		    ErrorSeverity,
		    ErrorState,
		    ErrorDateTime )
	    Values (
		    ERROR_LINE(),
		    ERROR_MESSAGE(),
		    ERROR_NUMBER(),
		    ERROR_PROCEDURE(),
		    ERROR_SEVERITY(),
		    ERROR_STATE(),
		    getdate() )
        end catch
    end
    else if  @sectiontype = 4           -- Latest Start Step to Latest Complete Step
    begin
          begin try
	         with SectionDef (
          TestSessionID, 
	      DurationDefID,
          startstep, 
	      endstep
        ) as (
          select 
            a.TestSessionID, 
            a.DurationDefId,
            startstep, 
            b.endstep 
          from 
            (
              select 

                a.TestSessionId, 
                b.DurationDefId,
                max(a.steporder) startstep 
              from 
                bridge.vwTestSessions_NoNotes a 
                join [dbo].[DimDurationDefinitions] b on a.OrganizationId = b.OrganizationKey 
                join DimExamSteps c on b.StartStepKey = c.ExamStepId 
                and a.StepName = c.StepName 
              where 
                b.DurationName = @DurationName 
			    and b.EffectiveTo = '2999/12/31'
			    and b.OrganizationKey = a.OrganizationId
                and a.TestDate between @StartDate
                and @Enddate
              group by 
                b.DurationDefId,
                a.TestSessionId
            ) a 
            join (
              select 
                a.TestSessionId, 
                max(a.steporder) endstep 
              from 
                bridge.vwTestSessions_NoNotes a 
                join [dbo].[DimDurationDefinitions] b on a.OrganizationId = b.OrganizationKey 
                join DimExamSteps c on b.CompleteStepKey = c.ExamStepId 
                and a.StepName = c.StepName 
              where 
                b.DurationName = @DurationName 
			    and b.EffectiveTo = '2999/12/31'
			    and b.OrganizationKey = a.OrganizationId
                and a.TestDate between @StartDate 
                and @Enddate
              group by 
                a.TestSessionId
            ) b on a.testsessionID = b.testsessionID
         
          where 
            endstep > startstep
        ) 
        Insert into Reporting.SectionDurations
            (DurationDefKey, TestSessionKey, StartStep,EndStep,Duration, DurationType )
        Select 
          SectionDef.DurationDefID, 
          SectionDef.TestSessionID,
          sectiondef.startstep, 
          sectiondef.endstep, 
          Sum(b.StepDuration),
          @SectionType
        from 
          SectionDef 
          join Bridge.vwTestSessions_NoNotes b on SectionDef.TestSessionID = b.TestSessionId
          and StepOrder between SectionDef.startstep 
          and SectionDef.endstep 
        group by 
          SectionDef.TestSessionID, 
          SectionDef.DurationDefID, 
          sectiondef.startstep, 
          sectiondef.endstep;
        end try
        Begin catch
	    Insert Logging.SQLErrors (
		    ErrorLIne,
		    ErrorMessage,
		    ErrorNumber,
		    ErrorProcedure,
		    ErrorSeverity,
		    ErrorState,
		    ErrorDateTime )
	    Values (
		    ERROR_LINE(),
		    ERROR_MESSAGE(),
		    ERROR_NUMBER(),
		    ERROR_PROCEDURE(),
		    ERROR_SEVERITY(),
		    ERROR_STATE(),
		    getdate() )
        end catch
    end

RETURN 0