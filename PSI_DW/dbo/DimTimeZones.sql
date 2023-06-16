CREATE TABLE [dbo].[DimTimeZones](
	[TimeZoneId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemID] [int] NOT NULL,
	[SSTimeZoneKey] [varchar](20) NOT NULL,
	[TimeZoneDesc] [varchar](200) NOT NULL,
	[RawUTCOffset] [varchar](6) NOT NULL,
	[OffsetInHours] [decimal](4, 2) NOT NULL,
	[OffsetInMinutes] [smallint] NOT NULL,
	[CountryKey] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TimeZoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]