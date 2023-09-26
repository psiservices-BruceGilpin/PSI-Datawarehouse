CREATE TABLE [Bridge].[TestInstance] (
    [TestInstanceId]  INT      IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey] INT      NOT NULL,
    [TestKey]         INT      NULL,
    [ExamSessionKey]  INT      NOT NULL,
    [TestDate]        INT      NOT NULL,
    [LoadDate]        DATETIME NOT NULL,
    [LoadKey]         INT      NOT NULL,
    PRIMARY KEY CLUSTERED ([TestInstanceId] ASC)
);

