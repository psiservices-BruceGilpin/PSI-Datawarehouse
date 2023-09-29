CREATE TABLE [Staging].[MultiCompletionStates] (
    [MCSId]           INT             IDENTITY (1, 1) NOT NULL,
    [TestSessionKey]  INT             NOT NULL,
    [DurationDefID]   INT             NOT NULL,
    [CompletionState] VARCHAR (10)    NOT NULL,
    [Duration]        DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([MCSId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_MultiCompletionStates_TestSession]
    ON [Staging].[MultiCompletionStates]([TestSessionKey] ASC);

