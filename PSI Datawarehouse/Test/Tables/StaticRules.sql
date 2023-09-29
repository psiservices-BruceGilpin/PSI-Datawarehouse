CREATE TABLE [Test].[StaticRules] (
    [StaticRuleId]            INT          IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]         SMALLINT     NOT NULL,
    [SourceSystemRuleID]      VARCHAR (20) NOT NULL,
    [StaticRuleDBID]          INT          NULL,
    [CurrentFlag]             BIT          DEFAULT ((0)) NOT NULL,
    [CreatedDate]             DATETIME     DEFAULT (getdate()) NOT NULL,
    [Checksum]                BIGINT       NOT NULL,
    [TestKey]                 BIGINT       NOT NULL,
    [TestModeType]            VARCHAR (10) NULL,
    [IsProctored]             BIT          NULL,
    [IsOpenBook]              BIT          NULL,
    [IsScoreReportFromClient] NCHAR (10)   NULL,
    [IsTestReviewAvailable]   BIT          NULL,
    [TestReviewAvailableType] VARCHAR (10) NULL,
    [ItemsReviewableType]     VARCHAR (10) NULL,
    [OptionsReviewableType]   VARCHAR (10) NULL,
    [TestReviewDuration]      INT          NULL,
    [IsTestReviewImmediate]   BIT          NULL,
    [MaxDaysBeforeReview]     INT          NULL,
    [RegnValidFor]            INT          NULL,
    [ValidityPeriod]          VARCHAR (10) NULL,
    [IsTestFeeFromClient]     BIT          NULL,
    [CatalogKey]              INT          NULL,
    [CancelBefore]            INT          NULL,
    [IsMultiSession]          BIT          NULL,
    [IsPhotoRequired]         BIT          NULL,
    [IsClientEligibilty]      BIT          NULL,
    [IsCreditPortionAllowed]  BIT          NULL,
    [CancelScheduleBefore]    DATETIME     NULL,
    [RescheduleBefore]        DATETIME     NULL,
    [IsScheduleBefore]        BIT          NULL,
    [ScheduleBefore]          DATETIME     NULL,
    [DaysToCompleteReview]    INT          NULL,
    PRIMARY KEY CLUSTERED ([StaticRuleId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_StaticRules_CurrentFlag]
    ON [Test].[StaticRules]([CurrentFlag] ASC)
    INCLUDE([StaticRuleDBID]);

