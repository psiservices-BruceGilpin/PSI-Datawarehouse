CREATE TABLE [dbo].[DimTestFixedFormStatus] (
    [TestFixedFormStatusID]        INT          IDENTITY (1, 1) NOT NULL,
    [SourceTestFixedFormStatusKey] VARCHAR (20) NULL,
    [SourceSystemKey]              INT          NULL,
    [Description]                  VARCHAR (70) NULL,
    CONSTRAINT [PKTestFixedFormStatusID] PRIMARY KEY CLUSTERED ([TestFixedFormStatusID] ASC)
);

