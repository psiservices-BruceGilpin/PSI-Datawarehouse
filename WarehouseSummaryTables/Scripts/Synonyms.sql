CREATE SYNONYM Dimensions.Areas_vw FOR [psi_reporting].Dimensions.Areas_vw
go
CREATE SYNONYM Dimensions.BankCategories_vw FOR [psi_reporting].Dimensions.Bankcategories_vw
go
CREATE SYNONYM Dimensions.BankCategoryGroups_vw FOR [psi_reporting].Dimensions.BankCategoryGroups_vw
go
CREATE SYNONYM Dimensions.Banks_vw FOR [psi_reporting].Dimensions.Banks_vw
go
CREATE SYNONYM Dimensions.Clients_vw FOR [psi_reporting].Dimensions.Clients_vw
go
CREATE SYNONYM Dimensions.Essays_vw FOR [psi_reporting].Dimensions.Essays_vw
go
CREATE SYNONYM Dimensions.ExamPortions_vw FOR [psi_reporting].Dimensions.ExamPortions_vw
go
CREATE SYNONYM Dimensions.PoolCodeGroups_vw FOR [psi_reporting].Dimensions.PoolCodeGroups_vw
go
CREATE SYNONYM Dimensions.PoolCodes_vw FOR [psi_reporting].Dimensions.PoolCodes_vw
go
CREATE SYNONYM Dimensions.QuestionContent_vw FOR [psi_reporting].Dimensions.QuestionContent_vw
go
CREATE SYNONYM Dimensions.Questions_vw FOR [psi_reporting].Dimensions.Questions_vw
go
CREATE SYNONYM Dimensions.ReapplicantTrue_vw FOR [psi_reporting].Dimensions.ReapplicantTrue_vw
go
CREATE SYNONYM Dimensions.RecertificationTrue_vw FOR [psi_reporting].Dimensions.RecertificationTrue_vw
go
CREATE SYNONYM Dimensions.StudentCodes_vw FOR [psi_reporting].Dimensions.StudentCodes_vw
go
CREATE SYNONYM Dimensions.StudentGroups_vw FOR [psi_reporting].Dimensions.StudentGroups_vw
go
CREATE SYNONYM Dimensions.StudentLists_vw FOR [psi_reporting].Dimensions.StudentLists_vw
go
CREATE SYNONYM Dimensions.StudentResponses_vw FOR [psi_reporting].Dimensions.StudentResponses_vw
go
CREATE SYNONYM Dimensions.Students_vw FOR [psi_reporting].Dimensions.Students_vw
go
CREATE SYNONYM Dimensions.StudentScores_vw FOR [psi_reporting].Dimensions.StudentScores_vw
go
CREATE SYNONYM Dimensions.StudentTestAttributes_vw FOR [psi_reporting].Dimensions.StudentTestAttributes_vw
go
CREATE SYNONYM Dimensions.TestLists_vw FOR [psi_reporting].Dimensions.TestLists_vw
go
CREATE SYNONYM Dimensions.TestPackages_vw FOR [psi_reporting].Dimensions.TestPackages_vw
go
CREATE SYNONYM Dimensions.TestQuestions_vw FOR [psi_reporting].Dimensions.TestQuestions_vw
go
CREATE SYNONYM Dimensions.Tests_vw FOR [psi_reporting].Dimensions.Tests_vw
go
CREATE SYNONYM Dimensions.TestSchedules_vw FOR [psi_reporting].Dimensions.TestSchedules_vw
go
CREATE SYNONYM Dimensions.TestSegments_vw FOR [psi_reporting].Dimensions.TestSegments_vw
go
Create Synonym Dimensions.StudentItems_vw For [psi_reporting].Dimensions.StudentItems_vw
go
Create Synonym Dimensions.QuestionStatus_vw For [psi_reporting].Dimensions.QuestionStatus_vw
go
Create Synonym Dimensions.QuestionTypes_vw For [psi_reporting].Dimensions.QuestionTypes_vw
go
Create Synonym Dimensions.Ampforms_vw for [psi_reporting].Dimensions.Ampforms_vw
go
Create Synonym [Dimensions].[Pools_vw] for [psi_reporting].[Dimensions].[Pools_vw]
USE [PSI_DW]
GO

CREATE SYNONYM [AtlasLC].[Accounts_vw] FOR [psi_reporting].[Account].[Accounts_vw]
GO
CREATE SYNONYM [AtlasLC].[AccountSchool_vw] FOR [psi_reporting].[account].[accountschool_vw]
GO
CREATE SYNONYM [AtlasLC].[CandidateResponses_vw] FOR [PSI_Reporting].[AtlasLC].[CandidateResponse_vw]
GO
CREATE SYNONYM [AtlasLC].[Candidates_VW] FOR [psi_reporting].[AtlasLC].[Candidates_vw]
GO
CREATE SYNONYM [AtlasLC].[CandidateSchedule_vw] FOR [psi_reporting].[AtlasLC].[CandidateSchedule_vw]
GO
CREATE SYNONYM [AtlasLC].[CompositeTestPortionScores_vw] FOR [PSI_Reporting].[AtlasLC].[CompositeTestPortionScores_vw]
GO
CREATE SYNONYM [AtlasLC].[CompositeTestView] FOR [psi_reporting].[AtlasLC].[CompositeTestPortionScores_vw]
GO
CREATE SYNONYM [AtlasLC].[demographics_vw] FOR [psi_reporting].[AtlasLC].[demographics_vw]
GO
CREATE SYNONYM [AtlasLC].[DemographicTypes_vw] FOR [psi_reporting].[AtlasLC].[demographictypes_vw]
GO
CREATE SYNONYM [AtlasLC].[Response_Vw] FOR [PSI_Reporting].[AtlasLC].[CandidateResponse_vw]
GO
CREATE SYNONYM [AtlasLC].[ResponseSelection_vw] FOR [PSI_Reporting].[AtlasLC].[CandidateResponseSelection_vw]
GO
CREATE SYNONYM [AtlasLC].[Schedule_vw] FOR [psi_reporting].[AtlasLC].[Schedule_vw]
GO
CREATE SYNONYM [AtlasLC].[TestAssignmentPortions_vw] FOR [PSI_Reporting].[AtlasLC].[TestAssignmentPortions_vw]
GO
CREATE SYNONYM [AtlasLC].[TestAssignments_vw] FOR [PSI_Reporting].[AtlasLC].[TestAssignments_vw]
GO
CREATE SYNONYM [AtlasLC].[TestLaunch_vw] FOR [psi_reporting].[AtlasLC].[TestLaunch]
GO
CREATE SYNONYM [dbo].[QuarterlyCalendar_vw] FOR [psi_reporting].[dbo].[QuarterlyCalendar_vw]
GO
CREATE SYNONYM [dbo].[TestSchedule_vw] FOR [SomeSchema].[SomeObject]
GO
CREATE SYNONYM [AtlasLC].[FixedForm_vw] FOR [PSI_Reporting].[AtlasLC].[FixedForm_Vw]
GO
CREATE SYNONYM [AtlasLC].[FixedFormItem_vw] FOR [PSI_Reporting].[AtlasLC].[FixedFormItem_vw]
GO
CREATE SYNONYM [AtlasLC].[Item_vw] FOR [PSI_Reporting].[AtlasLC].[Item_vw]
GO
CREATE SYNONYM [AtlasLC].[ItemOption_vw] FOR [PSI_Reporting].[AtlasLC].[ItemOption_vw]
GO
CREATE SYNONYM [AtlasLC].[ItemOptions_vw] FOR [PSI_Reporting].[AtlasLC].[ItemOption_Vw]
GO
CREATE SYNONYM [AtlasLC].[ItemPool_vw] FOR [PSI_Reporting].[AtlasLC].[ItemPool_vw]
GO
CREATE SYNONYM [AtlasLC].[Portion_vw] FOR [PSI_Reporting].[AtlasLC].[Portion_vw]
GO
CREATE SYNONYM [AtlasLC].[Test_vw] FOR [psi_reporting].[AtlasLC].[Tests_vw]
GO
CREATE SYNONYM [AtlasLC].[TestCenter_vw] FOR [PSI_Reporting].[AtlasLC].[TestCenter_vw]
GO
CREATE SYNONYM [AtlasLC].[TestCenterSchedule_vw] FOR [PSI_Reporting].[AtlasLC].[TestCenterSchedule_vw]
GO
CREATE SYNONYM [AtlasLC].[TestDefinition_vw] FOR [PSI_Reporting].[AtlasLC].[TestDefinition_vw]
GO
CREATE SYNONYM [AtlasLC].[TestStructure_vw] FOR [psi_reporting].[AtlasLC].[TestStructure_vw]
GO

