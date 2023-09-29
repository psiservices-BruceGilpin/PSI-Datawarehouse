CREATE TABLE [Aspen].[Demographics] (
    [DemographicId]          INT           IDENTITY (1, 1) NOT NULL,
    [DemographicDBID]        INT           NOT NULL,
    [CurrentFlag]            BIT           DEFAULT ((0)) NOT NULL,
    [CreateDate]             DATETIME      DEFAULT (getdate()) NOT NULL,
    [SourceSystemKey]        SMALLINT      NOT NULL,
    [SourceSystemID]         VARCHAR (20)  NOT NULL,
    [ApplicationKey]         INT           NOT NULL,
    [DemographicQuestionKey] INT           NOT NULL,
    [AnswerValue]            VARCHAR (250) NULL,
    PRIMARY KEY CLUSTERED ([DemographicId] ASC)
);

