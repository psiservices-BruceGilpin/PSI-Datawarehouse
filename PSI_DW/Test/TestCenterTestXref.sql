CREATE TABLE [Test].[TestCenterTestXref](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestKey] [int] NOT NULL,
	[TestCenterKey] [int] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[TestCenterTestXref]  WITH NOCHECK ADD  CONSTRAINT [FK_TestCenterTestXref_Test] FOREIGN KEY([TestKey])
REFERENCES [Test].[Tests] ([TestId])
GO

ALTER TABLE [Test].[TestCenterTestXref] CHECK CONSTRAINT [FK_TestCenterTestXref_Test]
GO
ALTER TABLE [Test].[TestCenterTestXref]  WITH NOCHECK ADD  CONSTRAINT [FK_TestCenterTestXref_TestCenter] FOREIGN KEY([TestCenterKey])
REFERENCES [Test].[TestCenter] ([TestCenterId])
GO

ALTER TABLE [Test].[TestCenterTestXref] CHECK CONSTRAINT [FK_TestCenterTestXref_TestCenter]
GO
ALTER TABLE [Test].[TestCenterTestXref] ADD  DEFAULT (getdate()) FOR [LoadDate]