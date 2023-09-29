CREATE TABLE [Staging].[StagingTestSessionStep] (
    [SessionID]     BIGINT          NOT NULL,
    [StepKey]       INT             NOT NULL,
    [Note]          VARCHAR (MAX)   NULL,
    [StartDate]     DATE            NOT NULL,
    [StartTime]     TIME (7)        NOT NULL,
    [StepOrder]     INT             NOT NULL,
    [EndDate]       DATE            NOT NULL,
    [EndTime]       TIME (7)        NOT NULL,
    [StepTimeStamp] DATETIME        NULL,
    [Duration]      DECIMAL (10, 2) NULL,
    [RunDate]       DATETIME        NOT NULL
);


GO
CREATE CLUSTERED INDEX [CX_StagingTestSessionStep]
    ON [Staging].[StagingTestSessionStep]([SessionID] ASC, [StepOrder] ASC);

