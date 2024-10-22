CREATE TABLE [Dimensions].[SamplingSpecifications]
(
	[SamplingSpecId] [int] IDENTITY(1,1) NOT NULL,
	[SamplingSpecDBId] [int] NULL,
	[CurrentFlag] [bit] NOT NULL,
	[CheckSum] [bigint] NOT NULL,
	[SourceSystemID] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ResultKey] [int] NULL,
	[BankKey] [int] NOT NULL,
	[Topic] [varchar](128) NULL,
	[SpecDescription] [varchar](512) NULL,
	[DateAdded] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LastUpdated] [datetime] NULL,
	[IsValid] [bit] NULL,
	[IsPublished] [bit] NOT NULL,
	[BelowMeanTolerance] [decimal](9, 2) NULL,
	[TargetMean] [decimal](9, 2) NULL,
	[AboveMeanTolerance] [decimal](9, 2) NULL,
	[BelowSDTolerance] [decimal](9, 2) NULL,
	[BelowReliabilityTolerance] [decimal](9, 2) NULL,
	[TargetReliability] [decimal](9, 2) NULL,
	[AboveReliabilityTolerance] [decimal](9, 2) NULL,
	[BelowCutScoreTolerance] [decimal](9, 3) NULL,
	[TargetCutScore] [decimal](9, 3) NULL,
	[AboveCutScoreTolerance] [decimal](9, 3) NULL,
	[RawCut] [int] NULL,
	[SurvivingFormsMinimum] [int] NOT NULL,
	[UseItemResponseTheory] [bit] NOT NULL,
	[BelowCSEMTolerance] [decimal](9, 3) NULL,
	[TargetCSEMTolerance] [decimal](9, 3) NULL,
	[AboceCSEMTolerance] [decimal](9, 3) NULL,
	[IsAta] [bit] NOT NULL,
	[NumberOfDesiredForms] [tinyint] NOT NULL,
	[ScaleCut] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SamplingSpecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE INDEX [IX_SamplingSpecifications_CurrentFlag] ON [Dimensions].[SamplingSpecifications] ([CurrentFlag])
Include (SamplingSpecDBID, ResultKey, BankKey)
