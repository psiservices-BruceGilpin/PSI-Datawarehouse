CREATE TABLE [Aspen].[ExamPortions] (
    [ExamPortionId]    INT            IDENTITY (1, 1) NOT NULL,
    [ExamPortionDBId]  INT            NOT NULL,
    [CurrentFlag]      BIT            DEFAULT ((0)) NOT NULL,
    [SourceSystemKey]  SMALLINT       NOT NULL,
    [SouceSystemId]    VARCHAR (20)   NOT NULL,
    [CreateDate]       DATETIME       DEFAULT (getdate()) NOT NULL,
    [PortionName]      VARCHAR (75)   NULL,
    [ExamLength]       DECIMAL (5, 2) NULL,
    [BeginEffectiveDt] DATE           NULL,
    [EndEffectiveDt]   DATE           NULL,
    [ComboExam]        CHAR (1)       NULL,
    PRIMARY KEY CLUSTERED ([ExamPortionId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ExamPortions_CurrentFlag]
    ON [Aspen].[ExamPortions]([CurrentFlag] ASC)
    INCLUDE([ExamPortionDBId]);

