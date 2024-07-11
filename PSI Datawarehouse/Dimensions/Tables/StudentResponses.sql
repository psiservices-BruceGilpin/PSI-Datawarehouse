CREATE TABLE [Dimensions].[StudentResponses] (
    [StudentResponseDBID]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [StudentItemKey]      BIGINT         NOT NULL,
    [NumericChoice]       SMALLINT       NULL,
    [StringChoice]        VARCHAR (5)    NULL,
    [ResponseIndex]       INT            NULL,
    [Points]              DECIMAL (6, 2) NULL,
    [CheckSum] BIGINT NULL, 
    [LoadDate]            DATETIME       DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([StudentResponseDBID] ASC)
);


GO

CREATE INDEX [IX_StudentResponses_StudentItemKey] ON [Dimensions].[StudentResponses] ([StudentItemKey])
Include ([Points])

GO

CREATE INDEX [IX_StudentResponses_Points] ON [Dimensions].[StudentResponses] ([Points])
Include (StudentItemKey)
