CREATE TABLE [dbo].[DimCastingType](
	[CastingTypeID] [int] IDENTITY(1,1) NOT NULL,
	[SourceCastingTypeKey] [varchar](20) NULL,
	[SourceSystemKey] [int] NULL,
	[Description] [varchar](70) NULL,
 CONSTRAINT [PKCastingTypeID] PRIMARY KEY CLUSTERED 
(
	[CastingTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]