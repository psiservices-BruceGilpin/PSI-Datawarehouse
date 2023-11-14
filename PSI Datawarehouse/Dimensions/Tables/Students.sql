CREATE TABLE [Dimensions].[Students] (
    [StudentsId]      BIGINT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey] SMALLINT         NOT NULL,
    [SourceStudentID] UNIQUEIDENTIFIER NOT NULL,
    [StudentDBID]     BIGINT           NOT NULL,
    [CurrentFlag]     BIT              NOT NULL,
    [PoolKey]         BIGINT           NULL,
    [StudentAltID]    VARCHAR (128)    NULL,
    [FirstName]       VARCHAR (30)     NULL,
    [LastName]        VARCHAR (30)     NULL,
    [StudentEmail]    VARCHAR (255)    NULL,
    [Phone]           VARCHAR (14)     NULL,
    [AltPhone]        VARCHAR (14)     NULL,
    [ADA]             BIT              NULL,
    [Gender]          INT              NULL,
    [Birthdate]       DATETIME         NULL,
    [MadienName]      VARCHAR (25)     NULL,
    [CheckSum]        BIGINT           NOT NULL,
    [LoadDate]        DATETIME         DEFAULT (getdate()) NOT NULL,
    [StudentType] TINYINT NULL, 
    PRIMARY KEY CLUSTERED ([StudentsId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Students_Name]
    ON [Dimensions].[Students]([LastName] ASC, [FirstName] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_Students_PoolKey]
    ON [Dimensions].[Students]([PoolKey] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_Students_StudentAltID]
    ON [Dimensions].[Students]([StudentAltID] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_Students_StudentDBID]
    ON [Dimensions].[Students]([StudentDBID] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_Students_CurrentFlag]
    ON [Dimensions].[Students]([CurrentFlag] ASC)
    INCLUDE([StudentDBID]);


GO
CREATE NONCLUSTERED INDEX [IXStudentsSourceStudentID]
    ON [Dimensions].[Students]([SourceStudentID] ASC)
    INCLUDE([StudentDBID], [CurrentFlag], [LoadDate]);

