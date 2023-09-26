CREATE TABLE [Test].[ItemStatus] (
    [ItemStatusId]    INT          IDENTITY (1, 1) NOT NULL,
    [ItemStatusCode]  VARCHAR (10) NOT NULL,
    [ItemStatus]      VARCHAR (25) NOT NULL,
    [SourceSystemKey] TINYINT      NOT NULL,
    [SourceStatusID]  VARCHAR (20) NULL,
    PRIMARY KEY CLUSTERED ([ItemStatusId] ASC)
);

