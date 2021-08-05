CREATE TABLE [dbo].[TeacherAuthenticationDetailsGrade]
(
[TeacherId] [int] NOT NULL,
[GradeId] [int] NOT NULL,
[TeacherAuthenticationDetailsGradeId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeacherAuthenticationDetailsGrade] ADD CONSTRAINT [PK_TeacherAuthenticationDetailsGrade] PRIMARY KEY CLUSTERED ([TeacherId], [GradeId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TeacherAuthenticationDetailsGrade_GradeId] ON [dbo].[TeacherAuthenticationDetailsGrade] ([GradeId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeacherAuthenticationDetailsGrade] ADD CONSTRAINT [FK_TeacherAuthenticationDetailsGrade_Grade_GradeId] FOREIGN KEY ([GradeId]) REFERENCES [dbo].[Grade] ([GradeId]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeacherAuthenticationDetailsGrade] ADD CONSTRAINT [FK_TeacherAuthenticationDetailsGrade_TeacherAuthenticationDetails_TeacherId] FOREIGN KEY ([TeacherId]) REFERENCES [dbo].[TeacherAuthenticationDetails] ([TeacherId]) ON DELETE CASCADE
GO
