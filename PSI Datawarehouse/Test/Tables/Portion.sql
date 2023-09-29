CREATE TABLE [Test].[Portion] (
    [PortionId]         INT             IDENTITY (1, 1) NOT NULL,
    [SourcePortionKey]  VARCHAR (20)    NULL,
    [SourceSystemKey]   INT             NULL,
    [TestKey]           INT             NOT NULL,
    [PortionName]       VARCHAR (100)   NOT NULL,
    [TestOrder]         TINYINT         NULL,
    [Description]       VARCHAR (50)    NULL,
    [IsScored]          BIT             NULL,
    [MinItemCount]      INT             NULL,
    [Duration]          INT             NULL,
    [PassingScore]      DECIMAL (10, 6) NULL,
    [ScaledCut]         INT             NULL,
    [CastingTrials]     INT             NULL,
    [CastingTypeKey]    INT             NULL,
    [CastingModel]      VARCHAR (20)    NULL,
    [ItemsToBeShown]    INT             NULL,
    [IsTimed]           BIT             NULL,
    [TotalItemWeight]   DECIMAL (10, 6) NULL,
    [TopicGroupingType] INT             NULL,
    [IVRPortionName]    VARCHAR (100)   NULL,
    [GroupLevelScoring] BIT             NULL,
    [FirstFormRandom]   BIT             NULL,
    [VariableCutScores] BIT             NULL,
    [ClientCode]        VARCHAR (50)    NULL,
    [PortionDBID]       INT             NOT NULL,
    [CreateDate]        DATETIME        CONSTRAINT [dfCreateDatePortion] DEFAULT (getdate()) NULL,
    [CurrentFlag]       BIT             CONSTRAINT [dfCreateDateCurrentFlag] DEFAULT ((0)) NOT NULL,
    [RawCut]            DECIMAL (10, 6) NULL,
    [Checksum]          INT             NULL,
    [PortionTypeKey]    TINYINT         NULL,
    [ItemCount]         INT             NULL,
    CONSTRAINT [PKPortionId] PRIMARY KEY CLUSTERED ([PortionId] ASC),
    CONSTRAINT [FK_Portion_Tests] FOREIGN KEY ([TestKey]) REFERENCES [Test].[Tests] ([TestId])
);


GO
CREATE NONCLUSTERED INDEX [IX_Portion_TestKey]
    ON [Test].[Portion]([TestKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Portion_SourcePortionKey]
    ON [Test].[Portion]([SourcePortionKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Portion_PortionDBID]
    ON [Test].[Portion]([PortionDBID] ASC) WHERE ([currentflag]=(0));

