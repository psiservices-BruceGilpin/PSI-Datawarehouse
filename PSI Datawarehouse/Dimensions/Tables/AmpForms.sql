CREATE TABLE [Dimensions].[AmpForms] (
    [AmpFormsId]          INT           IDENTITY (1, 1) NOT NULL,
    [AmpFormsDBID]        INT           NOT NULL,
    [CurrentFlag]         BIT           DEFAULT ((0)) NOT NULL,
    [SourceSystemKey]     SMALLINT      NOT NULL,
    [SourceSystemID]      VARCHAR (20)  NOT NULL,
    [CreateDate]          DATETIME      DEFAULT (getdate()) NOT NULL,
    [FormTestKey]         INT           NULL,
    [FormName]            VARCHAR (100) NOT NULL,
    [Rawcut]              INT           NULL,
    [ScaleCut]            INT           NULL,
    [TimeLimit]           INT           NULL,
    [FormAdminType]       VARCHAR (4)   NULL,
    [EffectiveFromDate]   DATETIME      NULL,
    [EffectiveToDate]     DATETIME      NULL,
    [ProvisionalFromDate] DATETIME      NULL,
    [ProvisionalToDate]   DATETIME      NULL,
    [CoreFormId]          Int           Null,
    [ScrambleOptions]     CHAR (1)      NULL,
    [ScrambleQuestions]   CHAR (1)      NULL,
    [Culture]             VARCHAR (50)  NULL,
    [Rawcut2]             INT           NULL,
    [CheckSum] BIGINT NULL, 
    PRIMARY KEY CLUSTERED ([AmpFormsId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_AmpForms_AmpFormsDBID]
    ON [Dimensions].[AmpForms]([AmpFormsDBID] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_AmpForms_CurrentFlag]
    ON [Dimensions].[AmpForms]([CurrentFlag] ASC)
    INCLUDE([AmpFormsDBID]);


GO
CREATE NONCLUSTERED INDEX [IX_AmpForms_FormName]
    ON [Dimensions].[AmpForms]([FormName] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_AmpForms_PortionKey]
    ON [Dimensions].[AmpForms]([FormTestKey] ASC) WHERE ([CurrentFlag]=(0));

