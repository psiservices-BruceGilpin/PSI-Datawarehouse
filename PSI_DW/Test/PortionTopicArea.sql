CREATE TABLE [Test].[PortionTopicArea](
	[PortionTopicAreaId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[SourceTopicAreaID] [varchar](20) NOT NULL,
	[PortionKey] [int] NOT NULL,
	[TopicName] [varchar](100) NOT NULL,
	[TopicAreaDescription] [varchar](50) NULL,
	[ItemCount] [int] NOT NULL,
	[PublicationStatus] [varchar](6) NULL,
	[ItemWeight] [decimal](10, 6) NULL,
	[SequenceNo] [int] NULL,
	[AllOrNothingFlag] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[CheckSum] [int] NOT NULL,
	[PortionTopicAreaDBID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PortionTopicAreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PortionTopicArea_TestKeyPortionKey] ON [Test].[PortionTopicArea]
(
	[PortionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]