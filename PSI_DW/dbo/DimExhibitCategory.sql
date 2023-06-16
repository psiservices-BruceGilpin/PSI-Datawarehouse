CREATE TABLE [dbo].[DimExhibitCategory](
	[ExhibitCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[SourceExhibitCategoryKey] [varchar](20) NULL,
	[SourceSystemKey] [int] NULL,
	[Description] [varchar](70) NULL,
 CONSTRAINT [PKExhibitCategoryID] PRIMARY KEY CLUSTERED 
(
	[ExhibitCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]