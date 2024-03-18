CREATE TABLE [Dimensions].[Questions] (
    [QuestionId]          BIGINT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]     SMALLINT         NOT NULL,
    [SourceQuestionID]    UNIQUEIDENTIFIER NOT NULL,
    [QuestionDBID]        BIGINT           NOT NULL,
    [CurrentFlag]         BIT              DEFAULT ((0)) NOT NULL,
    [QuestionTitle]       VARCHAR (50)     NOT NULL,
    [QuestionDescription] VARCHAR (2000)   NULL,
    [QuestionType]        INT              NULL,
    [QuestionStatus]      INT              NOT NULL,
    [CreatedDate]         DATETIME         NULL,
    [QuestionChoices]     INT              NOT NULL,
    [QuestionColumns]     INT              NOT NULL,
    [CorrectChoice]       INT              NOT NULL,
    [MaxResponses]        INT              NOT NULL,
    [PartialCredit]       BIT              DEFAULT ((0)) NULL,
    [UseHints]            BIT              DEFAULT ((0)) NULL,
    [ChoiceFeedback]      BIT              NULL,
    [MaxPoints]           DECIMAL (6, 4)   NULL,
    [MinPoints]           DECIMAL (6, 4)   NULL,
    [TimeLimit]           INT              NULL,
    [LeadInKey]           BIGINT           NULL,
    [Admins]              INT              NOT NULL,
    [QuestionELT]         DECIMAL (12, 5)  NULL,
    [QuestionsDiff]       DECIMAL (8, 5)   NULL,
    [QuestionsRPB]        DECIMAL (9, 5)   NULL,
    [QuestionsAvg]        DECIMAL (10, 5)  NULL,
    [Omits]               INT              NULL,
    [Stem]                VARCHAR (2500)   NOT NULL,
    [QuestionNotes]       VARCHAR (4000)   NULL,
    [RefCollapsed]        BIT              NULL,
    [Feedback]            VARCHAR (4000)   NULL,
    [Range1]              INT              NULL,
    [Range2]              INT              NULL,
    [Seed]                INT              NULL,
    [Scrambled]           BIT              NULL,
    [MatchCase]           BIT              NULL,
    [ExtraPointstype]     INT              NULL,
    [ExtraPoints]         INT              NULL,
    [SimStart]            BIT              NULL,
    [QuestionState]       INT              NOT NULL,
    [QuestionClass]       INT              NOT NULL,
    [QuestionLocked]      INT              NOT NULL,
    [ContentAreaKey]      BIGINT           NULL,
    [ContentSubAreaKey]   BIGINT           NULL,
    [MainQuestionKey]     BIGINT           NULL,
    [MainIdx]             INT              NOT NULL,
    [MainType]            INT              NULL,
    [UserValue1]          VARCHAR (50)     NULL,
    [UserValue2]          VARCHAR (50)     NULL,
    [Uservalue3]          VARCHAR (50)     NULL,
    [Uservalue4]          VARCHAR (50)     NULL,
    [Refx]                INT              NULL,
    [Refw]                INT              NULL,
    [RefH]                INT              NULL,
    [SourceID]            VARCHAR (50)     NULL,
    [Theta]               DECIMAL (6, 4)   NULL,
    [InfTheta]            DECIMAL (6, 4)   NULL,
    [LoadDate]            DATETIME         DEFAULT (getdate()) NULL,
    [CheckSum]            BIGINT           NOT NULL,
    [VersionNum]          SMALLInt         Null
    PRIMARY KEY CLUSTERED ([QuestionId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Questions_QuestionDBID]
    ON [Dimensions].[Questions]([QuestionDBID] ASC)
    INCLUDE([QuestionTitle]) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_Questions_QuestionTitle]
    ON [Dimensions].[Questions]([QuestionTitle] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IXQuestionsSourceQuestionID]
    ON [Dimensions].[Questions]([SourceQuestionID] ASC)
    INCLUDE([QuestionDBID], [CurrentFlag], [LoadDate]);


GO

CREATE INDEX [IX_Questions_CurrentFlag] ON [Dimensions].[Questions] ([CurrentFlag])
Include ([SourceQuestionID],[QuestionDBID],[QuestionStatus],[Admins],[VersionNum])
