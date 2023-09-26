CREATE TABLE [Bridge].[MajorIncidents] (
    [MajorIncidentId]        INT    IDENTITY (1, 1) NOT NULL,
    [TestSessionKey]         BIGINT NOT NULL,
    [ProctorKey]             INT    NOT NULL,
    [MajorIncidentReasonKey] INT    NOT NULL,
    PRIMARY KEY CLUSTERED ([MajorIncidentId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_MajorIncidents_TestSessionKey]
    ON [Bridge].[MajorIncidents]([TestSessionKey] ASC)
    INCLUDE([ProctorKey]);

