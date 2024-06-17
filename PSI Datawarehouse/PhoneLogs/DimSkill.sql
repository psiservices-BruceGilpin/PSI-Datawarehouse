CREATE TABLE [Nice].[DimSkill]
(
	[Id] INT PRIMARY KEY, 
    [SkillName] VARCHAR(254) NOT NULL, 
    [CreateDate] DATETIME NOT NULL DEFAULT getdate()
)
