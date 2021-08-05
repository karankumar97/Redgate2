CREATE TABLE [dbo].[Grade]
(
[GradeId] [int] NOT NULL IDENTITY(1, 1),
[GradeName] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Active] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Grade] ADD CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED ([GradeId]) ON [PRIMARY]
GO
