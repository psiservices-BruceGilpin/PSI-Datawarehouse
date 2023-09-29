CREATE TABLE [dbo].[DataDictionary] (
    [SchemaName]        [sysname]      NOT NULL,
    [TableName]         [sysname]      NOT NULL,
    [ColumnName]        [sysname]      NULL,
    [DataTypeName]      NVARCHAR (128) NULL,
    [MaxLength]         SMALLINT       NOT NULL,
    [Precision]         TINYINT        NOT NULL,
    [Scale]             TINYINT        NOT NULL,
    [IsNullable]        BIT            NULL,
    [PrimaryKey]        NVARCHAR (128) NULL,
    [ForeignKey]        NVARCHAR (128) NULL,
    [ColumnDescription] VARCHAR (79)   NOT NULL
);

