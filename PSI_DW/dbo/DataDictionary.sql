CREATE TABLE [dbo].[DataDictionary](
	[SchemaName] [sysname] NOT NULL,
	[TableName] [sysname] NOT NULL,
	[ColumnName] [sysname] NULL,
	[DataTypeName] [nvarchar](128) NULL,
	[MaxLength] [smallint] NOT NULL,
	[Precision] [tinyint] NOT NULL,
	[Scale] [tinyint] NOT NULL,
	[IsNullable] [bit] NULL,
	[PrimaryKey] [nvarchar](128) NULL,
	[ForeignKey] [nvarchar](128) NULL,
	[ColumnDescription] [varchar](79) NOT NULL
) ON [PRIMARY]