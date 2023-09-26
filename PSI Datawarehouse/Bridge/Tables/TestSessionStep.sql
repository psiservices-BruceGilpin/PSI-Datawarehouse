CREATE TABLE [Bridge].[TestSessionStep] (
    [TestSessionStepId] BIGINT          IDENTITY (1, 1) NOT NULL,
    [TestSessionKey]    BIGINT          NOT NULL,
    [StepKey]           INT             NOT NULL,
    [StartDate]         DATE            NOT NULL,
    [StartTime]         TIME (7)        NOT NULL,
    [StepOrder]         INT             NULL,
    [Enddate]           DATE            NOT NULL,
    [EndTime]           TIME (7)        NOT NULL,
    [Duration]          DECIMAL (10, 2) NULL,
    [StepTimeStamp]     DATETIME        NULL,
    [RunDate]           DATETIME        DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([TestSessionStepId] ASC),
    CONSTRAINT [FK_TestSessionStep_Test] FOREIGN KEY ([TestSessionKey]) REFERENCES [Bridge].[TestSession] ([TestSessionId])
);


GO
CREATE NONCLUSTERED INDEX [IX_TestSessionStep_TestStartDate]
    ON [Bridge].[TestSessionStep]([StepKey] ASC)
    INCLUDE([TestSessionKey], [StartDate], [StartTime], [StepOrder], [Enddate], [Duration]);


GO
CREATE NONCLUSTERED INDEX [IX_TestSessionStep_TestDate]
    ON [Bridge].[TestSessionStep]([StartDate] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TestSessionStep_TestSessionKey]
    ON [Bridge].[TestSessionStep]([TestSessionKey] ASC)
    INCLUDE([StepKey], [StartDate], [StartTime], [StepOrder], [EndTime], [Duration]);

