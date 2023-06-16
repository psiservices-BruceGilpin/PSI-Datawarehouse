CREATE TABLE [dbo].[DimItemOwnerShip](
	[ItemOwnershipId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[OwnershipKey] [varchar](20) NOT NULL,
	[OwnershipDescription] [varchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemOwnershipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]