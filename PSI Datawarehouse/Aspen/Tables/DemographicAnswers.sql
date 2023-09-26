CREATE TABLE [Aspen].[DemographicAnswers] (
    [DemoKeyId]         INT           IDENTITY (1, 1) NOT NULL,
    [DemoKeyDBId]       INT           NOT NULL,
    [CurrentFlag]       BIT           DEFAULT ((0)) NOT NULL,
    [SourceSystemKey]   SMALLINT      NOT NULL,
    [SourceSystemID]    VARCHAR (20)  NOT NULL,
    [CreateDate]        DATETIME      DEFAULT (getdate()) NOT NULL,
    [QuestionKey]       INT           NOT NULL,
    [AnswerCode]        VARCHAR (5)   NOT NULL,
    [AnswerDescription] VARCHAR (200) NOT NULL,
    [Demographic_ID]    INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([DemoKeyId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_DemographicAnswers_CurrentFlag]
    ON [Aspen].[DemographicAnswers]([CurrentFlag] ASC)
    INCLUDE([DemoKeyDBId]);

