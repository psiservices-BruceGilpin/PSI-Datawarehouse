CREATE TABLE [Test].[Tests] (
    [TestId]           INT           IDENTITY (1, 1) NOT NULL,
    [SourceTestKey]    VARCHAR (20)  NOT NULL,
    [SourceSystemKey]  INT           NULL,
    [TestName]         VARCHAR (100) NOT NULL,
    [TestDescription]  VARCHAR (255) NULL,
    [CategoryKey]      INT           NOT NULL,
    [AccountKey]       INT           NOT NULL,
    [PublicationPoolKey] bigint      NULL,
    [IVRTestName]      VARCHAR (200) NULL,
    [MarketSegment]    VARCHAR (6)   NULL,
    [ClientCode]       VARCHAR (50)  NULL,
    [GlobalTestID]     VARCHAR (20)  NOT NULL,
    [TestCreationDate] DATE          NULL,
    [ContentType]      VARCHAR (20)  NULL,
    [ExamID]           VARCHAR (50)  NULL,
    [ApiToken]         VARCHAR (255) NULL,
    [Checksum]         INT           NOT NULL,
    [CreatedDate]      DATE          CONSTRAINT [dfTestsCreatedDate] DEFAULT (getdate()) NOT NULL,
    [RunID]            INT           NOT NULL,
    [TestStatusKey]    SMALLINT      NULL,
    [TestTypeKey]      SMALLINT      NULL,
    [TestDBKey]        INT           NULL,
    [CurrentFlag]      BIT           CONSTRAINT [dfTestsCurrentFlag] DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([TestId] ASC),
    CONSTRAINT [FK_Tests_TestCategory] FOREIGN KEY ([CategoryKey]) REFERENCES [Test].[TestCategory] ([TestCategoryId])
);


GO
CREATE NONCLUSTERED INDEX [IX_Tests_SourceTestKey]
    ON [Test].[Tests]([SourceTestKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Tests_TestDBKey]
    ON [Test].[Tests]([TestDBKey] ASC) WHERE ([CurrentFlag]=(0));

