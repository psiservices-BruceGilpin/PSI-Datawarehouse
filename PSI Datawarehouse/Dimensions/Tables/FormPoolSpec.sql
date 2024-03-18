CREATE TABLE [Dimensions].[FormPoolSpecs] (
    [FormPoolSpecId]INT           IDENTITY (1, 1) NOT NULL,
    [FormPoolSpecDBId]    INT            NULL,
    [CurrentFlag]      BIT           DEFAULT ((0)) NOT NULL,
    [CheckSum]         BIGINT        Not Null,
    [SourceSystemID]   UNIQUEIDENTIFIER  NOT NULL,
    [CreateDate]       DATETIME      DEFAULT (getdate()) NOT NULL,
    [BankKey]          INT           NOT NULL,
    [Topic]            VARCHAR (128) NULL,
    [PoolDescription]  VARCHAR (512) NULL,
    [DateAdded] DATETIME NOT NULL, 
    [IsDeleted] BIT NOT NULL, 
    [LastUpdated] DATETIME NULL, 
    [IsValid] BIT NULL, 
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
    [AboveCSEMTolerance] DECIMAL(9, 3) NULL, 
    [IsAta] BIT NOT NULL, 
    [NumberOfDesiredForms] TINYINT NOT NULL, 
    [ScaleCut] INT NULL, 
    PRIMARY KEY CLUSTERED ([FormPoolSpecId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_PublicationPool_CurrentFlag]
    ON [Dimensions].[FormPoolSpecs]([CurrentFlag] ASC)
    INCLUDE([FormPoolSpecDBId]);

