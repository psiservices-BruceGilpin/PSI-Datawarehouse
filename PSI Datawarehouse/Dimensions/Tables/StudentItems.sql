CREATE TABLE [Dimensions].[StudentItems] (
    [StudentItemDBId]  BIGINT         IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]  SMALLINT       NOT NULL,
    [SourceSystemID]   VARCHAR (50)   NOT NULL,
    [CreateDate]       DATETIME       DEFAULT (getdate()) NOT NULL,
    [Checksum]         BIGINT         NULL,
    [StudentScoreKey]  BIGINT         NOT NULL,
    [TestQuestionKey]  BIGINT         NOT NULL,
    [Points]           SMALLINT       NULL,
    [Correct]          SMALLINT       NULL,
    [QuestionTime]     DATETIME       NULL,
    [ElapsedTime]      INT            NULL,
    [MaxPoints]        SMALLINT       NULL,
    [QuestionSequence] SMALLINT       NULL,
    [FinalPoints]      DECIMAL (6, 2) NULL,
    [ExtraPoints]      DECIMAL (6, 2) NULL,
    PRIMARY KEY CLUSTERED ([StudentItemDBId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_StudentItems_StudentScoreKey]
    ON [Dimensions].[StudentItems]([StudentScoreKey] ASC, [testquestionkey]) ;


GO

CREATE INDEX [IX_StudentItems_TestQuestionKey] ON [Dimensions].[StudentItems] ([TestQuestionKey])
Include ([StudentScoreKey])

GO
