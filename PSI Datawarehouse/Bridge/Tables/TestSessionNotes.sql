CREATE TABLE [Bridge].[TestSessionNotes] (
    [TestInstanceNoteId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [TestSessionStepKey] BIGINT         NOT NULL,
    [NoteType]           VARCHAR (50)   NOT NULL,
    [NoteText]           VARCHAR (1000) NOT NULL,
    PRIMARY KEY CLUSTERED ([TestInstanceNoteId] ASC),
    CONSTRAINT [FK_TestInstanceNotes_ToTestInstance] FOREIGN KEY ([TestSessionStepKey]) REFERENCES [Bridge].[TestSessionStep] ([TestSessionStepId])
);


GO
CREATE NONCLUSTERED INDEX [IX_TestInstanceNotes_TestIntanceKey]
    ON [Bridge].[TestSessionNotes]([TestSessionStepKey] ASC);

