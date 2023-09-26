CREATE TABLE [Dimensions].[TestLists] (
    [TestListId]       BIGINT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]  SMALLINT         NOT NULL,
    [SourceTestListID] UNIQUEIDENTIFIER NOT NULL,
    [TestListDBID]     BIGINT           NULL,
    [CurrentFlag]      BIT              DEFAULT ((0)) NOT NULL,
    [TestPackageKey]   BIGINT           NULL,
    [TestKey]          BIGINT           NOT NULL,
    [TestSeq]          INT              NOT NULL,
    [TestTitle]        VARCHAR (150)    NULL,
    [Scramble]         BIT              NULL,
    [Randomize]        BIT              NULL,
    [GradeType]        INT              NULL,
    [WholeTime]        INT              NULL,
    [WarnTime]         INT              NULL,
    [Feedback]         BIT              NULL,
    [Comment]          BIT              NULL,
    [CreatedDate]      DATETIME         NULL,
    [Checksum]         BIGINT           NULL,
    [LoadDate]         DATETIME         DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([TestListId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_TestLists_TestKey]
    ON [Dimensions].[TestLists]([TestKey] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_TestLists_TestListDBID]
    ON [Dimensions].[TestLists]([TestListDBID] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_TestLists_TestPackageKey]
    ON [Dimensions].[TestLists]([TestPackageKey] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_TestLists_TestTitle]
    ON [Dimensions].[TestLists]([TestTitle] ASC)
    INCLUDE([TestListDBID]) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_TestLists_CurrentFlag]
    ON [Dimensions].[TestLists]([CurrentFlag] ASC)
    INCLUDE([TestListDBID]);


GO
CREATE NONCLUSTERED INDEX [IXTestListsSourceTestListID]
    ON [Dimensions].[TestLists]([SourceTestListID] ASC)
    INCLUDE([TestListDBID], [CurrentFlag], [LoadDate]);

