CREATE TABLE [dbo].[DimCalendar] (
    [Date]           DATE          NOT NULL,
    [Year]           INT           NOT NULL,
    [Quarter]        INT           NOT NULL,
    [Month]          INT           NOT NULL,
    [MonthName]      NVARCHAR (30) NOT NULL,
    [Week]           INT           NOT NULL,
    [DayOfWeek]      INT           NOT NULL,
    [DayOfMonth]     INT           NOT NULL,
    [DayOfYear]      INT           NOT NULL,
    [DayName]        NVARCHAR (30) NOT NULL,
    [IsHolidayUS]    VARCHAR (50)  NULL,
    [IsHolidayNonUS] VARCHAR (50)  NULL,
    CONSTRAINT [PKDate] PRIMARY KEY CLUSTERED ([Date] ASC)
);

