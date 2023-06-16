CREATE TABLE [TzDb].[Intervals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ZoneId] [int] NOT NULL,
	[UtcStart] [datetime2](0) NOT NULL,
	[UtcEnd] [datetime2](0) NOT NULL,
	[LocalStart] [datetime2](0) NOT NULL,
	[LocalEnd] [datetime2](0) NOT NULL,
	[OffsetMinutes] [smallint] NOT NULL,
	[Abbreviation] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TzDb].[Intervals]  WITH CHECK ADD  CONSTRAINT [FK_Intervals_Zones] FOREIGN KEY([ZoneId])
REFERENCES [TzDb].[Zones] ([Id])
GO

ALTER TABLE [TzDb].[Intervals] CHECK CONSTRAINT [FK_Intervals_Zones]