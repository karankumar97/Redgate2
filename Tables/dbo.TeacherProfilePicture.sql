CREATE TABLE [dbo].[TeacherProfilePicture]
(
[TeacherProfilePictureId] [int] NOT NULL IDENTITY(1, 1),
[TeacherId] [int] NOT NULL,
[PhotographURL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeacherProfilePicture] ADD CONSTRAINT [PK_TeacherProfilePicture] PRIMARY KEY CLUSTERED ([TeacherProfilePictureId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TeacherProfilePicture_TeacherId] ON [dbo].[TeacherProfilePicture] ([TeacherId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeacherProfilePicture] ADD CONSTRAINT [FK_TeacherProfilePicture_TeacherBasicInformation_TeacherId] FOREIGN KEY ([TeacherId]) REFERENCES [dbo].[TeacherBasicInformation] ([TeacherId]) ON DELETE CASCADE
GO
