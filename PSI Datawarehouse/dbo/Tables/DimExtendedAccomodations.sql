CREATE TABLE [dbo].[DimExtendedAccomodations] (
    [ExtendedAccomodationId] INT            IDENTITY (1, 1) NOT NULL,
    [ExAccDescription]       VARCHAR (50)   NOT NULL,
    [EnumKey]                VARCHAR (10)   NOT NULL,
    [ExtAccValue]            DECIMAL (6, 2) NOT NULL,
    [ExtAccDisplayOrder]     TINYINT        NULL,
    [RaID]                   INT            NULL,
    [SourceSystemID]         TINYINT        NOT NULL,
    [SourceExtAccID]         INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([ExtendedAccomodationId] ASC)
);

