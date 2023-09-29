CREATE TABLE [Staging].[StagingTestSessionNotes] (
    [StepID]   BIGINT         NOT NULL,
    [NoteType] VARCHAR (50)   NOT NULL,
    [NoteText] VARCHAR (1000) NOT NULL
);


GO
CREATE CLUSTERED INDEX [CX_StagingTestSessionNotes]
    ON [Staging].[StagingTestSessionNotes]([StepID] ASC);

