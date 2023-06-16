CREATE TABLE [Test].[StaticRules](
	[StaticRuleId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemRuleID] [varchar](20) NOT NULL,
	[StaticRuleDBID] [int] NULL,
	[CurrentFlag] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Checksum] [bigint] NOT NULL,
	[TestKey] [bigint] NOT NULL,
	[TestModeType] [varchar](10) NULL,
	[IsProctored] [bit] NULL,
	[IsOpenBook] [bit] NULL,
	[IsScoreReportFromClient] [nchar](10) NULL,
	[IsTestReviewAvailable] [bit] NULL,
	[TestReviewAvailableType] [varchar](10) NULL,
	[ItemsReviewableType] [varchar](10) NULL,
	[OptionsReviewableType] [varchar](10) NULL,
	[TestReviewDuration] [int] NULL,
	[IsTestReviewImmediate] [bit] NULL,
	[MaxDaysBeforeReview] [int] NULL,
	[RegnValidFor] [int] NULL,
	[ValidityPeriod] [varchar](10) NULL,
	[IsTestFeeFromClient] [bit] NULL,
	[CatalogKey] [int] NULL,
	[CancelBefore] [int] NULL,
	[IsMultiSession] [bit] NULL,
	[IsPhotoRequired] [bit] NULL,
	[IsClientEligibilty] [bit] NULL,
	[IsCreditPortionAllowed] [bit] NULL,
	[CancelScheduleBefore] [datetime] NULL,
	[RescheduleBefore] [datetime] NULL,
	[IsScheduleBefore] [bit] NULL,
	[ScheduleBefore] [datetime] NULL,
	[DaysToCompleteReview] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StaticRuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[StaticRules] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Test].[StaticRules] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
CREATE NONCLUSTERED INDEX [IX_StaticRules_CurrentFlag] ON [Test].[StaticRules]
(
	[CurrentFlag] ASC
)
INCLUDE([StaticRuleDBID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]