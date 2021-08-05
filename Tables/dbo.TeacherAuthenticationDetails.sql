CREATE TABLE [dbo].[TeacherAuthenticationDetails]
(
[TeacherId] [int] NOT NULL IDENTITY(1, 1),
[TeacherObjectId] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TeacherName] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TeacherEmailAddress] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeacherAuthenticationDetails] ADD CONSTRAINT [PK_TeacherAuthenticationDetails] PRIMARY KEY CLUSTERED ([TeacherId]) ON [PRIMARY]
GO
