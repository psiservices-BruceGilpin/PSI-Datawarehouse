CREATE TABLE [LXRData].[KeyValues](
	[KeyValueId] [bigint] NOT NULL,
	[SourceTableKey] [smallint] NOT NULL,
	[SourceGuid] [uniqueidentifier] NOT NULL,
	[DWKey] [int] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KeyValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [LXRData].[KeyValues]  WITH CHECK ADD  CONSTRAINT [FK_KeyValues_LXRTables] FOREIGN KEY([SourceTableKey])
REFERENCES [LXRData].[Tables] ([TableId])
GO

ALTER TABLE [LXRData].[KeyValues] CHECK CONSTRAINT [FK_KeyValues_LXRTables]