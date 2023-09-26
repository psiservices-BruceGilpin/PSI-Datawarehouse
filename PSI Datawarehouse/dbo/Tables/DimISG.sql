CREATE TABLE [dbo].[DimISG] (
    [ISGID]           INT          IDENTITY (1, 1) NOT NULL,
    [ISGKey]          VARCHAR (20) NULL,
    [SourceSystemKey] INT          NULL,
    [Description]     VARCHAR (70) NULL,
    CONSTRAINT [PKISGID] PRIMARY KEY CLUSTERED ([ISGID] ASC)
);

