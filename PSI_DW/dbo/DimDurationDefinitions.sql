CREATE TABLE [dbo].[DimDurationDefinitions](
	[DurationDefId] [int] IDENTITY(1,1) NOT NULL,
	[DurationName] [varchar](100) NOT NULL,
	[OrganizationKey] [int] NOT NULL,
	[StartStepKey] [int] NOT NULL,
	[CompleteStepKey] [int] NOT NULL,
	[CompletionState] [varchar](10) NULL,
	[OneStepFlag] [bit] NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo] [date] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimDurationDefinitions] ADD  DEFAULT (getdate()) FOR [EffectiveFrom]
GO
ALTER TABLE [dbo].[DimDurationDefinitions] ADD  DEFAULT ('2999/12/31') FOR [EffectiveTo]