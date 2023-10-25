CREATE TABLE [Dimensions].[Tests] (
    [TestId]          BIGINT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey] SMALLINT         NOT NULL,
    [SourceTestID]    UNIQUEIDENTIFIER NOT NULL,
    [TestDBId]        BIGINT           NOT NULL,
    [CurrentFlag]     BIT              DEFAULT ((0)) NOT NULL,
    [PublicationPoolItemDBID] Int      Null,
    [TestTitle]       VARCHAR (50)     NOT NULL,
    [TestDesc]        VARCHAR (2000)   NULL,
    [TestStatus]      TINYINT          NOT NULL,
    [TestResultKey]   BIGINT           NULL,
    [TestBankKey]     BIGINT           NULL,
    [TestSim]         BIT              NULL,
    [TotalPoints]     INT              NULL,
    [TotalItems]      INT              NULL,
    [TestRefx]        INT              NULL,
    [TestRefy]        INT              NULL,
    [TestRefh]        INT              NULL,
    [TestRefw]        INT              NULL,
    [TestState]       INT              NOT NULL,
    [TestClass]       INT              NOT NULL,
    [TestLocked]      INT              NOT NULL,
    [TestVersnum]     INT              NOT NULL,
    [CheckSum]        BIGINT           NULL,
    [LoadDate]        DATETIME         DEFAULT (getdate()) NOT NULL,
    [AreaKey]         INT              NULL,
    PRIMARY KEY CLUSTERED ([TestId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Tests_TestBankKey]
    ON [Dimensions].[Tests]([TestBankKey] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_Tests_TestDBId]
    ON [Dimensions].[Tests]([TestDBId] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_Tests_TestResultKey]
    ON [Dimensions].[Tests]([TestResultKey] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_Tests_TestTitle]
    ON [Dimensions].[Tests]([TestTitle] ASC)
    INCLUDE([TestDBId]) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IXTestsSourceTestID]
    ON [Dimensions].[Tests]([SourceTestID] ASC)
    INCLUDE([TestDBId], [CurrentFlag], [LoadDate]);

