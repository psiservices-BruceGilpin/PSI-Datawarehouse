﻿CREATE TABLE [Dimensions].[StudentItems] (
    [StudentItemId]    BIGINT         IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]  SMALLINT       NOT NULL,
    [SourceSystemID]   VARCHAR (50)   NOT NULL,
    [CurrentFlag]      BIT            DEFAULT ((0)) NOT NULL,
    [CreateDate]       DATETIME       DEFAULT (getdate()) NOT NULL,
    [Checksum]         BIGINT         NOT NULL,
    [StudentItemDBID]  BIGINT         NOT NULL,
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
    PRIMARY KEY CLUSTERED ([StudentItemId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_StudentItems_CurrentFlag]
    ON [Dimensions].[StudentItems]([CurrentFlag] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_StudentItems_StudentItemDBID]
    ON [Dimensions].[StudentItems]([StudentItemDBID] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_StudentItems_StudentScoreKey]
    ON [Dimensions].[StudentItems]([StudentScoreKey] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_StudentItems_TestQuestionKey]
    ON [Dimensions].[StudentItems]([TestQuestionKey] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IXStudentItemsSourceSystemID]
    ON [Dimensions].[StudentItems]([SourceSystemID] ASC)
    INCLUDE([CurrentFlag], [CreateDate], [StudentItemDBID]);

