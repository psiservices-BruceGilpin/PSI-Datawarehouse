CREATE TABLE [dbo].[DimDeliveryMethods](
	[DeliveryMethodId] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryCode] [varchar](20) NOT NULL,
	[DeliveryDescripton] [varchar](70) NOT NULL,
	[SourceSystemKey] [tinyint] NOT NULL,
	[SourceDeliveryID] [varchar](20) NOT NULL,
	[SessionUser] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimDeliveryMethods] ADD  DEFAULT (suser_sname()) FOR [SessionUser]