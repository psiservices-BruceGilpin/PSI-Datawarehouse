/****** Object:  View [LookupTables].[Calendar_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [LookupTables].[Calendar_vw]
	AS 
	SELECT 
	[Date] 'Calendar Date',
	[Year] 'Calendar Year',
	[Quarter] 'Calendar Quarter',
	[Month] 'Calendar Month',
	[Monthname] 'Month Name',
	[Week] 'Week of Year',
	[DayOfWeek] 'Day of Week',
	[DayOfMonth] 'Day of Month',
	[DayOfYear] 'Day of Year',
	[DayName] 'Day Name',
	[IsHolidayUS] 'US Holiday',
	[IsHolidayNonUs] 'Non US Holiday'
	
	FROM [$(PSI_DW)]..DimCalendar with (nolock)