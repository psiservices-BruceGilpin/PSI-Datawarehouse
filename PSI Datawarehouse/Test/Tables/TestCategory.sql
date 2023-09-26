CREATE TABLE [Test].[TestCategory] (
    [TestCategoryId]        INT          IDENTITY (1, 1) NOT NULL,
    [ParentCategoryKey]     INT          NULL,
    [SourceSystemKey]       INT          NOT NULL,
    [SourceTestCategoryKey] VARCHAR (20) NULL,
    [TestCategoryName]      VARCHAR (75) NULL,
    [Checksum]              INT          NOT NULL,
    [CurrentFlag]           BIT          CONSTRAINT [dfTestCategoryCurrentFlag] DEFAULT ((0)) NOT NULL,
    [RunID]                 INT          NOT NULL,
    [CreatedDate]           DATE         CONSTRAINT [dfTestCategoryCreatedDate] DEFAULT (getdate()) NOT NULL,
    [TestCategoryDBID]      INT          NULL,
    PRIMARY KEY CLUSTERED ([TestCategoryId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_TestCategory_TestCategoryDBID]
    ON [Test].[TestCategory]([TestCategoryDBID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TestCategory_SourceTestCategoryKey]
    ON [Test].[TestCategory]([SourceTestCategoryKey] ASC);

