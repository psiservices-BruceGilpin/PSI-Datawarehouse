CREATE TABLE [dbo].[DimCalendar](
	[Date] [date] NOT NULL,
	[Year] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[MonthName] [nvarchar](30) NOT NULL,
	[Week] [int] NOT NULL,
	[DayOfWeek] [int] NOT NULL,
	[DayOfMonth] [int] NOT NULL,
	[DayOfYear] [int] NOT NULL,
	[DayName] [nvarchar](30) NOT NULL,
	[IsHolidayUS] [varchar](50) NULL,
	[IsHolidayNonUS] [varchar](50) NULL,
 CONSTRAINT [PKDate] PRIMARY KEY CLUSTERED 
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]