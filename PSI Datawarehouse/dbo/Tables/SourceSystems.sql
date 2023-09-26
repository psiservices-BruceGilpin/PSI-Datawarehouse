CREATE TABLE [dbo].[SourceSystems] (
    [SourceSystemId]   INT          IDENTITY (1, 1) NOT NULL,
    [SourceSystemName] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([SourceSystemId] ASC)
);

