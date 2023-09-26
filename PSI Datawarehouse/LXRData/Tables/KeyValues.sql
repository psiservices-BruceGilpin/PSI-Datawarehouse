CREATE TABLE [LXRData].[KeyValues] (
    [KeyValueId]     BIGINT           NOT NULL,
    [SourceTableKey] SMALLINT         NOT NULL,
    [SourceGuid]     UNIQUEIDENTIFIER NOT NULL,
    [DWKey]          INT              NOT NULL,
    [CreateDate]     DATETIME2 (7)    NOT NULL,
    PRIMARY KEY CLUSTERED ([KeyValueId] ASC),
    CONSTRAINT [FK_KeyValues_LXRTables] FOREIGN KEY ([SourceTableKey]) REFERENCES [LXRData].[Tables] ([TableId])
);

