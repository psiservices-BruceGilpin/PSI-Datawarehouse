CREATE TABLE [dbo].[DimItemOwnerShip] (
    [ItemOwnershipId]      INT          IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]      INT          NOT NULL,
    [OwnershipKey]         VARCHAR (20) NOT NULL,
    [OwnershipDescription] VARCHAR (70) NULL,
    PRIMARY KEY CLUSTERED ([ItemOwnershipId] ASC)
);

