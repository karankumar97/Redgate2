CREATE TABLE [dbo].[TeacherServicesRate]
(
[TeacherId] [int] NOT NULL,
[HighSchoolBoardId] [int] NOT NULL,
[GradeId] [int] NOT NULL,
[SubjectId] [int] NOT NULL,
[TeacherServicesRateId] [int] NOT NULL IDENTITY(1, 1),
[AverageClassesPerWeek] [int] NOT NULL,
[ClassesPerAcademicYear] [int] NOT NULL,
[RateMonthlyBilling] [decimal] (18, 2) NOT NULL,
[DiscountForUpfrontPayments] [bit] NOT NULL,
[DiscountForMultipleStudentsPerClass] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeacherServicesRate] ADD CONSTRAINT [PK_TeacherServicesRate] PRIMARY KEY CLUSTERED ([TeacherId], [HighSchoolBoardId], [GradeId], [SubjectId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TeacherServicesRate_GradeId] ON [dbo].[TeacherServicesRate] ([GradeId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TeacherServicesRate_HighSchoolBoardId] ON [dbo].[TeacherServicesRate] ([HighSchoolBoardId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TeacherServicesRate_SubjectId] ON [dbo].[TeacherServicesRate] ([SubjectId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeacherServicesRate] ADD CONSTRAINT [FK_TeacherServicesRate_Grade_GradeId] FOREIGN KEY ([GradeId]) REFERENCES [dbo].[Grade] ([GradeId]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeacherServicesRate] ADD CONSTRAINT [FK_TeacherServicesRate_HighSchoolBoard_HighSchoolBoardId] FOREIGN KEY ([HighSchoolBoardId]) REFERENCES [dbo].[HighSchoolBoard] ([HighSchoolBoardId]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeacherServicesRate] ADD CONSTRAINT [FK_TeacherServicesRate_Subject_SubjectId] FOREIGN KEY ([SubjectId]) REFERENCES [dbo].[Subject] ([SubjectId]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeacherServicesRate] ADD CONSTRAINT [FK_TeacherServicesRate_TeacherBasicInformation_TeacherId] FOREIGN KEY ([TeacherId]) REFERENCES [dbo].[TeacherBasicInformation] ([TeacherId]) ON DELETE CASCADE
GO
