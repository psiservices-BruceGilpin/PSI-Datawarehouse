/****** Object:  View [dbo].[QuarterlyCalendar_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [dbo].[QuarterlyCalendar_vw]
	AS SELECT 
	 min([date]) qtrStart,
	 max([date]) qtrEnd
	FROM [$(PSI_DW)].dbo.DimCalendar
	group by [Year], [Quarter]