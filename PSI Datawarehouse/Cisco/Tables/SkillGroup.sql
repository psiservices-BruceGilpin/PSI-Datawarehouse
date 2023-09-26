CREATE TABLE [Cisco].[SkillGroup] (
    [SkillGroupId]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [SourceSkillTargetKey]  INT          NULL,
    [PrceisionQueueKey]     INT          NULL,
    [SourceSystemKey]       INT          NULL,
    [PeripheralID]          SMALLINT     NULL,
    [EnterpriseName]        VARCHAR (50) NULL,
    [PeripheralNumber]      INT          NULL,
    [PeripheralName]        VARCHAR (50) NULL,
    [AvailableHoldoffDelay] SMALLINT     NULL,
    [Priority]              SMALLINT     NULL,
    [BaseSkillTargetID]     INT          NULL,
    [IsDeleted]             CHAR (1)     NULL,
    [MRDomainID]            INT          NULL,
    [IPTA]                  CHAR (1)     NULL,
    [DefaultEntry]          INT          NULL,
    [UserDeletable]         CHAR (1)     NULL,
    [ServiceLevelThreshold] INT          NULL,
    [ServiceLevelType]      SMALLINT     NULL,
    [ChangeStamp]           INT          NULL,
    [RunID]                 INT          NULL,
    [EffectiveFrom]         DATETIME     NULL,
    [CheckSum]              INT          NULL,
    [EffectiveTo]           DATETIME     CONSTRAINT [dfSkillGroupEffectiveTo] DEFAULT ('2999-12-31') NULL,
    CONSTRAINT [PKSkillGroupId] PRIMARY KEY CLUSTERED ([SkillGroupId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_SkillGroup_SourceSkillTargetKey_PrceisionQueueKey]
    ON [Cisco].[SkillGroup]([SourceSkillTargetKey] ASC, [PrceisionQueueKey] ASC);

