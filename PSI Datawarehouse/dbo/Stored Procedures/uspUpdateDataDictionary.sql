/*****************************************************************
CREATED BY: William Davis
CREATED ON: 3/23/2022
USED BY: SQL Server Agent Job Load PSI_DW_DataDictionary
DESCRIPTION:
	--Created Temp Table
	--Inserts Data into Temp Table via System Tables
	--Merges Data into dbo.DataDictionary
	--Drops Temp Table
EDITS:

*******************************************************************/

CREATE PROCEDURE
	[dbo].[uspUpdateDataDictionary]
AS
--Set Session Options

SET XACT_ABORT ON --Ensure all failed transactions are rolled back

SET NOCOUNT ON -- Suppress Record Count Messages

--Update Packages

BEGIN TRY

--Created Temp Table
CREATE TABLE #DataDictionary
(
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
)

--Inserts Data into Temp Table via System Tables
INSERT INTO #DataDictionary

SELECT
	schemas.name AS SchemaName,
	tables.name AS TableName,
	columns.name AS ColumnName,
	UPPER(types.name) AS DataTypeName,
	columns.max_length AS MaxLength,
	columns.precision AS Precision,
	columns.scale AS Scale,
	columns.is_nullable AS IsNullable
	,CASE WHEN a.CONSTRAINT_TYPE = 'PRIMARY KEY' THEN CONSTRAINT_NAME ELSE '' END AS PrimaryKey
	,CASE WHEN a.CONSTRAINT_TYPE = 'FOREIGN KEY' THEN CONSTRAINT_NAME ELSE '' END AS ForeignKey
	,CASE WHEN is_identity = 1 THEN 'Identity Column' ELSE '' END AS ColumnDescription
FROM 
	sys.tables
INNER JOIN 
	sys.columns
ON 
	tables.object_id = columns.object_id
INNER JOIN 
	sys.types
ON 
	types.user_type_id = columns.user_type_id
INNER JOIN 
	sys.schemas
ON 
	schemas.schema_id = tables.schema_id
LEFT OUTER JOIN
(
	SELECT 
	 a.TABLE_NAME
	,a.TABLE_SCHEMA
	,b.COLUMN_NAME
	,a.CONSTRAINT_NAME
	,a.CONSTRAINT_TYPE
FROM  
	INFORMATION_SCHEMA.TABLE_CONSTRAINTS a  
JOIN 
	INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE b  
ON 
	a.CONSTRAINT_NAME=b.CONSTRAINT_NAME  
WHERE 
	a.CONSTRAINT_TYPE IN ('PRIMARY KEY','FOREIGN KEY')
) a
ON
	tables.name = a.TABLE_NAME	AND schemas.name = a.TABLE_SCHEMA
AND
	 columns.name = a.COLUMN_NAME 
WHERE 
	tables.is_ms_shipped = 0
AND 
	schemas.name <> 'Staging' 
AND 
	tables.name NOT IN('__RefactorLog','DataDictionary','sysdiagrams')
AND 
	tables.name NOT LIKE '%Temp';

--SELECT * FROM #DataDictionary

	--Merges Data into dbo.DataDictionary
MERGE
	[dbo].[DataDictionary] t
USING
	#DataDictionary s
ON
	t.[SchemaName] = s.[SchemaName] AND t.[TableName] = s.[TableName] AND t.[ColumnName] = s.[ColumnName]
WHEN NOT MATCHED THEN INSERT
(
	 [SchemaName]
	,[TableName]
	,[ColumnName]
	,[DataTypeName]
	,[MaxLength]
	,[Precision]
	,[Scale]
	,[IsNullable]
	,[PrimaryKey]
	,[ForeignKey]
	,[ColumnDescription]
)
VALUES
(
	 s.[SchemaName]
	,s.[TableName]
	,s.[ColumnName]
	,s.[DataTypeName]
	,s.[MaxLength]
	,s.[Precision]
	,s.[Scale]
	,s.[IsNullable]
	,s.[PrimaryKey]
	,s.[ForeignKey]
	,s.[ColumnDescription]
)
WHEN MATCHED THEN UPDATE SET
	 t.[DataTypeName] = s.[DataTypeName] 
	,t.[MaxLength] = s.[MaxLength]
	,t.[Precision] = s.[Precision]
	,t.[Scale] = s.[Scale]
	,t.[IsNullable] = s.[IsNullable]
	,t.[PrimaryKey] = s.[PrimaryKey]
	,t.[ForeignKey] = s.[ForeignKey];

	--Drops Temp Table
DROP TABLE #DataDictionary;

END TRY

BEGIN CATCH

   IF @@trancount > 0 ROLLBACK TRANSACTION

	INSERT INTO 
		[Logging].[SQLErrors] 
	(
		ErrorNumber,
		ErrorSeverity,
		ErrorState,
		ErrorProcedure,
		ErrorLine,
		ErrorMessage,
		ErrorDateTime
	)
	VALUES 
	(
		ERROR_NUMBER(),ERROR_SEVERITY(),ERROR_STATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE(),GETDATE()
	)

END CATCH