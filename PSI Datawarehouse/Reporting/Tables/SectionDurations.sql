CREATE TABLE [Reporting].[SectionDurations] (
    [DurationIDId]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [DurationDefKey] INT             NOT NULL,
    [TestSessionKey] BIGINT          NOT NULL,
    [DurationType]   SMALLINT        NOT NULL,
    [StartStep]      INT             NOT NULL,
    [EndStep]        INT             NOT NULL,
    [Duration]       DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([DurationIDId] ASC),
    CONSTRAINT [FK_Reporting_TestSession1] FOREIGN KEY ([TestSessionKey]) REFERENCES [Bridge].[TestSession] ([TestSessionId])
);


GO
CREATE NONCLUSTERED INDEX [IX_SectionDurations_TestSessionKey2]
    ON [Reporting].[SectionDurations]([TestSessionKey] ASC);

