CREATE TABLE [Dimensions].[SamplingSpecifications] (
    [SamplingSpecId]   INT           IDENTITY (1, 1) NOT NULL,
    [SamplingSpecDBId] INT           NOT NULL,
    [CurrentFlag]      BIT           DEFAULT ((0)) NOT NULL,
    [CheckSum]         BIGINT        Not Null,
    [SourceSystemKey]  SMALLINT      NOT NULL,
    [SourceSystemID]   VARCHAR (20)  NOT NULL,
    [CreateDate]       DATETIME      DEFAULT (getdate()) NOT NULL,
    [ResultID]        UNIQUEIDENTIFIER           NOT NULL,
    [BankKey]          INT           NOT NULL,
    [Topic]            VARCHAR (128) NULL,
    [SpecDescription]  VARCHAR (512) NULL,
    [DateAdded] DATETIME NOT NULL, 
    [IsDeleted] BIT NOT NULL, 
    [LastUpdated] DATETIME NULL, 
    [IsValid] BIT NOT NULL, 
    [LastValidated] DATETIME NULL, 
    [IsPublished] BIT NOT NULL, 
    [BelowMeanTolerance] DECIMAL(9, 2) NULL, 
    [TargetMean] DECIMAL(9, 2) NULL, 
    [AboveMeanTolerance] DECIMAL(9, 2) NULL, 
    [BelowSDTolerance] DECIMAL(9, 2) NULL, 
    [BelowReliabilityTolerance] DECIMAL(9, 2) NULL, 
    [TargetReliability] DECIMAL(9, 2) NULL, 
    [AboveReliabilityTolerance] DECIMAL(9, 2) NULL, 
    [BelowCutScoreTolerance] DECIMAL(9, 3) NULL, 
    [TargetCutScore] DECIMAL(9, 3) NULL, 
    [AboveCutScoreTolerance] DECIMAL(9, 3) NULL, 
    [RawCut] INT NULL, 
    [SurvivingFormsMinimum] INT NOT NULL, 
    [UseItemResponseTheory] BIT NOT NULL, 
    [BelowCSEMTolerance] DECIMAL(9, 3) NULL, 
    [TargetCSEMTolerance] DECIMAL(9, 3) NULL, 
    [AboceCSEMTolerance] DECIMAL(9, 3) NULL, 
    [IsAta] BIT NOT NULL, 
    [NumberOfDesiredForms] TINYINT NOT NULL, 
    [ScaleCut] INT NULL, 
    PRIMARY KEY CLUSTERED ([SamplingSpecId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_SamplingSpecifications_CurrentFlag]
    ON [Dimensions].[SamplingSpecifications]([CurrentFlag] ASC)
    INCLUDE([SamplingSpecDBId]);

