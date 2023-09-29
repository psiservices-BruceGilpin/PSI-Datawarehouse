CREATE TABLE [Bridge].[Annotation] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [Violation]      VARCHAR (150) NOT NULL,
    [Level]          VARCHAR (12)  NOT NULL,
    [TestSessionKey] BIGINT        NOT NULL,
    [ProctorKey]     INT           NOT NULL,
    [Source]         VARCHAR (50)  NOT NULL,
    [Mode]           VARCHAR (6)   NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Annotation_TestSession]
    ON [Bridge].[Annotation]([TestSessionKey] ASC)
    INCLUDE([ProctorKey]);


GO
CREATE NONCLUSTERED INDEX [IX_Annotation_Proctor]
    ON [Bridge].[Annotation]([ProctorKey] ASC)
    INCLUDE([TestSessionKey]);

