CREATE TABLE [dbo].[DimCountries](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemID] [int] NOT NULL,
	[SSCountryKey] [varchar](10) NOT NULL,
	[CountryName] [varchar](100) NOT NULL,
	[CountryCode] [varchar](5) NOT NULL,
	[SortOrder] [tinyint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[CountryCodeAlpha3] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]