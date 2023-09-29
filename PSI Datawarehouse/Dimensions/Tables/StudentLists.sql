CREATE TABLE [Dimensions].[StudentLists] (
    [StudentListId]       BIGINT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]     SMALLINT         NOT NULL,
    [SourceStudentListID] UNIQUEIDENTIFIER NOT NULL,
    [StudentListDBID]     BIGINT           NOT NULL,
    [CurrentFlag]         BIT              DEFAULT ((0)) NOT NULL,
    [StudentKey]          BIGINT           NOT NULL,
    [StudentGroupKey]     BIGINT           NULL,
    [StudentListType]     BIT              NULL,
    [StudentStatus]       BIT              NULL,
    [HideReports]         BIT              NULL,
    [InsReports]          BIT              NULL,
    [LoadDate]            DATETIME         DEFAULT (getdate()) NOT NULL,
    [CheckSum]            BIGINT           NOT NULL,
    PRIMARY KEY CLUSTERED ([StudentListId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_StudentLists_StudentGroupKey]
    ON [Dimensions].[StudentLists]([StudentGroupKey] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_StudentLists_StudentKey]
    ON [Dimensions].[StudentLists]([StudentKey] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_StudentLists_StudentListDBID]
    ON [Dimensions].[StudentLists]([StudentListDBID] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_StudentLists_CurrentFlag]
    ON [Dimensions].[StudentLists]([CurrentFlag] ASC)
    INCLUDE([StudentListDBID], [StudentKey]);


GO
CREATE NONCLUSTERED INDEX [IXStudentListsSourceStudentListID]
    ON [Dimensions].[StudentLists]([SourceStudentListID] ASC)
    INCLUDE([StudentListDBID], [CurrentFlag], [LoadDate]);

