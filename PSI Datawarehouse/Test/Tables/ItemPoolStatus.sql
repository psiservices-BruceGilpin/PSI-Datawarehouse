CREATE TABLE [Test].[ItemPoolStatus] (
    [ItemPoolStatusId]     INT          IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]      SMALLINT     NOT NULL,
    [SourcSystemStatusKey] VARCHAR (20) NOT NULL,
    [StatusState]          VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([ItemPoolStatusId] ASC)
);

