CREATE TABLE [dbo].[TeacherVideoGrade]
(
[TeacherVideoGradeId] [int] NOT NULL IDENTITY(1, 1),
[TeacherVideoGalleryId] [int] NOT NULL,
[GradeId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeacherVideoGrade] ADD CONSTRAINT [PK_TeacherVideoGrade] PRIMARY KEY CLUSTERED ([TeacherVideoGradeId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TeacherVideoGrade_GradeId] ON [dbo].[TeacherVideoGrade] ([GradeId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TeacherVideoGrade_TeacherVideoGalleryId] ON [dbo].[TeacherVideoGrade] ([TeacherVideoGalleryId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeacherVideoGrade] ADD CONSTRAINT [FK_TeacherVideoGrade_Grade_GradeId] FOREIGN KEY ([GradeId]) REFERENCES [dbo].[Grade] ([GradeId]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeacherVideoGrade] ADD CONSTRAINT [FK_TeacherVideoGrade_TeacherVideoGallery_TeacherVideoGalleryId] FOREIGN KEY ([TeacherVideoGalleryId]) REFERENCES [dbo].[TeacherVideoGallery] ([TeacherVideoGalleryId]) ON DELETE CASCADE
GO
