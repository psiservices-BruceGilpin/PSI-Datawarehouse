CREATE TABLE [Dimensions].[QuestionContent] (
    [QuestionContentId]       BIGINT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]         SMALLINT         NOT NULL,
    [SourceQuestionContentId] UNIQUEIDENTIFIER NOT NULL,
    [QuestionContentDBID]     BIGINT           NOT NULL,
    [CurrentFlag]             BIT              NOT NULL,
    [QuestionKey]             BIGINT           NOT NULL,
    [ContentIndex]            INT              NOT NULL,
    [ContentResult]           VARCHAR (100)    NULL,
    [Points]                  INT              NOT NULL,
    [Correct]                 BIT              NULL,
    [Feedback]                VARCHAR (1500)   NULL,
    [HotspotX]                INT              NULL,
    [HotspotY]                INT              NULL,
    [HotspotW]                INT              NULL,
    [HotspotH]                INT              NULL,
    [Required]                BIT              NULL,
    [Forgivable]              BIT              NULL,
    [Checksum]                BIGINT           NOT NULL,
    [LoadDate]                DATETIME         DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([QuestionContentId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_QuestionContent_ContentDBID]
    ON [Dimensions].[QuestionContent]([QuestionContentDBID] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_QuestionContent_QuestionKey]
    ON [Dimensions].[QuestionContent]([QuestionKey] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IXQuestionContentSourceQuestionContentId]
    ON [Dimensions].[QuestionContent]([SourceQuestionContentId] ASC)
    INCLUDE([QuestionContentDBID], [CurrentFlag], [LoadDate]);

