CREATE TABLE [Dimensions].[StudentGroups] (
    [StudentGroupId]   BIGINT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]  NCHAR (10)       NOT NULL,
    [SourceGroupID]    UNIQUEIDENTIFIER NOT NULL,
    [StudentGroupDBID] BIGINT           NOT NULL,
    [StudentPoolKey]   BIGINT           NOT NULL,
    [PoolKey]          BIGINT           NULL,
    [CurrentFlag]      BIT              DEFAULT ((0)) NOT NULL,
    [StudentGrpTitle]  VARCHAR (50)     NOT NULL,
    [CheckSum]         BIGINT           NOT NULL,
    [LoadDate]         DATETIME         DEFAULT (getdate()) NOT NULL,
    [GroupCreationDate] DATETIME NULL, 
    PRIMARY KEY CLUSTERED ([StudentGroupId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_StudentGroups_StudentGroupDBID]
    ON [Dimensions].[StudentGroups]([StudentGroupDBID] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_StudentGroups_Currentflag]
    ON [Dimensions].[StudentGroups]([CurrentFlag] ASC)
    INCLUDE([StudentGroupDBID]);


GO
CREATE NONCLUSTERED INDEX [IX_StudentGroups_PoolKey]
    ON [Dimensions].[StudentGroups]([PoolKey] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_StudentGroups_StudentGrpTitle]
    ON [Dimensions].[StudentGroups]([StudentGrpTitle] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IXStudentGroupsSourceGroupID]
    ON [Dimensions].[StudentGroups]([SourceGroupID] ASC)
    INCLUDE([StudentGroupDBID], [CurrentFlag], [LoadDate]);

