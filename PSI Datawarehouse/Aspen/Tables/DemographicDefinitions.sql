CREATE TABLE [Aspen].[DemographicDefinitions] (
    [DemographicId]         INT           IDENTITY (1, 1) NOT NULL,
    [DemographicDBID]       INT           NOT NULL,
    [Currentflag]           BIT           DEFAULT ((0)) NOT NULL,
    [CreateDate]            DATE          DEFAULT (getdate()) NOT NULL,
    [SourceSystemkey]       SMALLINT      NOT NULL,
    [SourceSystemID]        VARCHAR (20)  NOT NULL,
    [ExamKey]               INT           NOT NULL,
    [BeginingEffectiveDate] DATE          NOT NULL,
    [EndEffectiveDate]      DATE          NOT NULL,
    [Question]              VARCHAR (200) NULL,
    [QuestionType]          VARCHAR (10)  NULL,
    [QuestionNumber]        SMALLINT      NULL,
    [NumberOfResponses]     SMALLINT      NULL,
    [ResponseType]          CHAR (1)      NULL,
    [Required]              CHAR (1)      NULL,
    PRIMARY KEY CLUSTERED ([DemographicId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_DemographicDefinitions_CurrentFlag]
    ON [Aspen].[DemographicDefinitions]([Currentflag] ASC)
    INCLUDE([DemographicDBID]);

