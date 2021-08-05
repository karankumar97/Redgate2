CREATE TABLE [dbo].[TeacherVideoGallery]
(
[TeacherVideoGalleryId] [int] NOT NULL IDENTITY(1, 1),
[TeacherId] [int] NOT NULL,
[VideoDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VideoUrl] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VideoTitle] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[InputAsset] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OutputAsset] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VideoSubject] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VideoTopic] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreateDateTime] [datetime2] NOT NULL,
[LastModifiedDateTime] [datetime2] NOT NULL,
[IsActive] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeacherVideoGallery] ADD CONSTRAINT [PK_TeacherVideoGallery] PRIMARY KEY CLUSTERED ([TeacherVideoGalleryId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TeacherVideoGallery_TeacherId] ON [dbo].[TeacherVideoGallery] ([TeacherId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeacherVideoGallery] ADD CONSTRAINT [FK_TeacherVideoGallery_TeacherAuthenticationDetails_TeacherId] FOREIGN KEY ([TeacherId]) REFERENCES [dbo].[TeacherAuthenticationDetails] ([TeacherId]) ON DELETE CASCADE
GO
