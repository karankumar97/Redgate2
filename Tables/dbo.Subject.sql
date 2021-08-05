CREATE TABLE [dbo].[Subject]
(
[SubjectId] [int] NOT NULL IDENTITY(1, 1),
[SubjectName] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Active] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Subject] ADD CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED ([SubjectId]) ON [PRIMARY]
GO
