CREATE TABLE [Dimensions].[ExamPortions] (
    [ExamPortionId]   INT           IDENTITY (1, 1) NOT NULL,
    [ExamPortionDBID] INT           NOT NULL,
    [CurrentFlag]     BIT           DEFAULT ((0)) NOT NULL,
    [SourceSystemKey] SMALLINT      NOT NULL,
    [SourceSystemID]  VARCHAR (20)  NOT NULL,
    [CreateDate]      DATETIME      DEFAULT (getdate()) NOT NULL,
    [Code]            VARCHAR (16)  NOT NULL,
    [Description]     VARCHAR (256) NOT NULL,
    [CalculatorEn]    BIT           NOT NULL,
    [RefEn]           BIT           NOT NULL,
    [LOFTEn]          BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([ExamPortionId] ASC)
);

