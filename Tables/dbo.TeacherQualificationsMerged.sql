CREATE TABLE [dbo].[TeacherQualificationsMerged]
(
[TeacherQualificationsMergedId] [int] NOT NULL IDENTITY(1, 1),
[TeacherId] [int] NOT NULL,
[TeacherQualifications] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TeacherSubjects] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NULL,
[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeacherQualificationsMerged] ADD CONSTRAINT [FK_TeacherQualificationsMerged_TeacherBasicInformation] FOREIGN KEY ([TeacherId]) REFERENCES [dbo].[TeacherBasicInformation] ([TeacherId])
GO
