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
CREATE NONCLUSTERED INDEX [IX_Students_StudentDBID]
    ON [Dimensions].[Students] ([StudentDBID])  Where (Currentflag = 0);


GO
CREATE NONCLUSTERED INDEX [IX_Students_CurrentFlag]
    ON [Dimensions].[Students]([CurrentFlag], [PoolKey])
    INCLUDE([StudentDBID] );


GO


CREATE INDEX [IX_Students_SourceStudentID] ON [Dimensions].[Students] ([SourceStudentID])
