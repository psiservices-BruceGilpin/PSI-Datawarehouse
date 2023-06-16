CREATE PROCEDURE [dbo].[CheckSumCalculation]
	@TableName Varchar(100)
AS
	Set Nocount On
	Set Xact_abort on

	Declare @SQL NVarchar(1500), @update Nvarchar(1500), @cols Nvarchar(200)
	Begin Try
		Declare c1 cursor for
			Select columnname from [PSI_Staging].[Logging].[ChecksumConfig] where TableName = @TableName
		Open c1
		fetch next from c1 into @cols		
		select @SQL = N'Checksum(' + @cols
		While @@FETCH_STATUS = 0
		Begin
			fetch next from c1 into @cols
            if @@FETCH_STATUS = 0
            begin
                select @SQL = @SQL + ',' + @cols
            end
		end
		select @SQL = @sql + ')'
		select @update = N'Update Staging.' + @TableName + N' Set [Checksum] = ' + @SQL
		execute sp_executesql @update
	end try
	begin catch
		Insert [PSI_Staging].[Logging].[SQLErrors] (
			 ErrorNumber,
			 ErrorSeverity,
			 ErrorState,
			 ErrorProcedure,
			 ErrorLine,
			 ErrorMessage )
		values (
			 Error_Number(),
			 Error_Severity(),
			 ERROR_STATE(),
			 ERROR_PROCEDURE(),
			 ERROR_LINE(),
			 ERROR_MESSAGE() )
	end catch