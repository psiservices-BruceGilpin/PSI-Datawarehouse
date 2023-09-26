CREATE TABLE [Dimensions].[TestQuestions] (
    [TestQuestionId]       BIGINT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]      SMALLINT         NOT NULL,
    [SourceTestQuestionID] UNIQUEIDENTIFIER NOT NULL,
    [TestQuestionDBID]     BIGINT           NOT NULL,
    [CurrentFlag]          BIT              NOT NULL,
    [TestSegmentsKey]      BIGINT           NOT NULL,
    [QuestionKey]          BIGINT           NOT NULL,
    [Section]              INT              NULL,
    [QuestionSequence]     INT              NULL,
    [CheckSum]             BIGINT           NOT NULL,
    [LoadDate]             DATETIME         DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([TestQuestionId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_TestQuestions_QuestionKey]
    ON [Dimensions].[TestQuestions]([QuestionKey] ASC, [TestSegmentsKey] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_TestQuestions_TestQuestionDBID]
    ON [Dimensions].[TestQuestions]([TestQuestionDBID] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IXTestQuestionsSourceTestQuestionID]
    ON [Dimensions].[TestQuestions]([SourceTestQuestionID] ASC)
    INCLUDE([TestQuestionDBID], [CurrentFlag], [LoadDate]);

