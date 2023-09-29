CREATE TABLE [dbo].[MigratedTests] (
    [MigrationId] INT           IDENTITY (1, 1) NOT NULL,
    [AccountKey]  INT           NOT NULL,
    [AccountName] VARCHAR (100) NOT NULL,
    [TestKey]     INT           NOT NULL,
    [TestName]    VARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([MigrationId] ASC)
);

