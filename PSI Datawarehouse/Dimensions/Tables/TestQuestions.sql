﻿CREATE TABLE [Dimensions].[TestQuestions] (
    [TestQuestionDBID]       BIGINT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]      SMALLINT         NOT NULL,
    [SourceTestQuestionID] UNIQUEIDENTIFIER NOT NULL,
    [TestSegmentsKey]      BIGINT           NOT NULL,
    [QuestionKey]          BIGINT           NOT NULL,
    [Section]              INT              NULL,
    [QuestionSequence]     INT              NULL,
    [CheckSum]             BIGINT           NOT NULL,
    [LoadDate]             DATETIME         DEFAULT (getdate()) NOT NULL,
    [EffectiveDate] DATE NULL, 
    PRIMARY KEY CLUSTERED ([TestQuestionDBID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_TestQuestions_QuestionKey]
    ON [Dimensions].[TestQuestions]([QuestionKey] ASC, [TestSegmentsKey] ASC) ;


GO
