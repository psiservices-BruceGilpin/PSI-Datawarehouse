CREATE TABLE [TzDb].[Links] (
    [LinkZoneId]      INT NOT NULL,
    [CanonicalZoneId] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([LinkZoneId] ASC),
    CONSTRAINT [FK_Links_Zones] FOREIGN KEY ([LinkZoneId]) REFERENCES [TzDb].[Zones] ([Id]),
    CONSTRAINT [FK_Links_Zones2] FOREIGN KEY ([CanonicalZoneId]) REFERENCES [TzDb].[Zones] ([Id])
);

