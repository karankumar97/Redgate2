CREATE TABLE [dbo].[TeacherPhotograph]
(
[TeacherPhotographId] [int] NOT NULL IDENTITY(1, 1),
[TeacherId] [int] NOT NULL,
[PhotographURL] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeacherPhotograph] ADD CONSTRAINT [PK_TeacherPhotograph] PRIMARY KEY CLUSTERED ([TeacherPhotographId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TeacherPhotograph_TeacherId] ON [dbo].[TeacherPhotograph] ([TeacherId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeacherPhotograph] ADD CONSTRAINT [FK_TeacherPhotograph_TeacherAuthenticationDetails_TeacherId] FOREIGN KEY ([TeacherId]) REFERENCES [dbo].[TeacherAuthenticationDetails] ([TeacherId]) ON DELETE CASCADE
GO
