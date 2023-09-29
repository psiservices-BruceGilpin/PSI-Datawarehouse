CREATE TABLE [dbo].[DimTestFixedFormItemStatus] (
    [TestFixedFormItemStatusID]        INT          IDENTITY (1, 1) NOT NULL,
    [SourceTestFixedFormItemStatusKey] VARCHAR (20) NULL,
    [SourceSystemKey]                  INT          NULL,
    [Description]                      VARCHAR (70) NULL,
    CONSTRAINT [PKTestFixedFormItemStatusID] PRIMARY KEY CLUSTERED ([TestFixedFormItemStatusID] ASC)
);

