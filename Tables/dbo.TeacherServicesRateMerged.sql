CREATE TABLE [dbo].[TeacherServicesRateMerged]
(
[TeacherServicesRateMergedId] [int] NOT NULL IDENTITY(1, 1),
[TeacherService] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TeacherRate] [money] NOT NULL,
[HighSchoolBoardId] [int] NOT NULL,
[GradeId] [int] NOT NULL,
[SubjectId] [int] NOT NULL,
[TeacherId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeacherServicesRateMerged] ADD CONSTRAINT [FK_TeacherServicesRateMerged_Grade] FOREIGN KEY ([GradeId]) REFERENCES [dbo].[Grade] ([GradeId])
GO
ALTER TABLE [dbo].[TeacherServicesRateMerged] ADD CONSTRAINT [FK_TeacherServicesRateMerged_HighSchoolBoard] FOREIGN KEY ([HighSchoolBoardId]) REFERENCES [dbo].[HighSchoolBoard] ([HighSchoolBoardId])
GO
ALTER TABLE [dbo].[TeacherServicesRateMerged] ADD CONSTRAINT [FK_TeacherServicesRateMerged_Subject] FOREIGN KEY ([SubjectId]) REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[TeacherServicesRateMerged] ADD CONSTRAINT [FK_TeacherServicesRateMerged_TeacherBasicInformation] FOREIGN KEY ([TeacherId]) REFERENCES [dbo].[TeacherBasicInformation] ([TeacherId])
GO
