CREATE TABLE [dbo].[DimExtendedAccomodations](
	[ExtendedAccomodationId] [int] IDENTITY(1,1) NOT NULL,
	[ExAccDescription] [varchar](50) NOT NULL,
	[EnumKey] [varchar](10) NOT NULL,
	[ExtAccValue] [decimal](6, 2) NOT NULL,
	[ExtAccDisplayOrder] [tinyint] NULL,
	[RaID] [int] NULL,
	[SourceSystemID] [tinyint] NOT NULL,
	[SourceExtAccID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ExtendedAccomodationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]