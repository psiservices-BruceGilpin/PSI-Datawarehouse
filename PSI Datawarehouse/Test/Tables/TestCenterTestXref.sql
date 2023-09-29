CREATE TABLE [Test].[TestCenterTestXref] (
    [Id]              INT      IDENTITY (1, 1) NOT NULL,
    [TestKey]         INT      NOT NULL,
    [TestCenterKey]   INT      NOT NULL,
    [LoadDate]        DATETIME DEFAULT (getdate()) NOT NULL,
    [SourceSystemKey] INT      NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TestCenterTestXref_Test] FOREIGN KEY ([TestKey]) REFERENCES [Test].[Tests] ([TestId]),
    CONSTRAINT [FK_TestCenterTestXref_TestCenter] FOREIGN KEY ([TestCenterKey]) REFERENCES [Test].[TestCenter] ([TestCenterId])
);

