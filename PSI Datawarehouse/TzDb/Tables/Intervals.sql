CREATE TABLE [TzDb].[Intervals] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [ZoneId]        INT           NOT NULL,
    [UtcStart]      DATETIME2 (0) NOT NULL,
    [UtcEnd]        DATETIME2 (0) NOT NULL,
    [LocalStart]    DATETIME2 (0) NOT NULL,
    [LocalEnd]      DATETIME2 (0) NOT NULL,
    [OffsetMinutes] SMALLINT      NOT NULL,
    [Abbreviation]  VARCHAR (10)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Intervals_Zones] FOREIGN KEY ([ZoneId]) REFERENCES [TzDb].[Zones] ([Id])
);

