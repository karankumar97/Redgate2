CREATE TABLE [dbo].[TeacherHelpdesk]
(
[TeacherHelpdeskId] [int] NOT NULL IDENTITY(1, 1),
[TeacherId] [int] NOT NULL,
[Teacher_Name] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email_Address] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Request_details] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateTime] [datetime2] NOT NULL,
[SendGridConfirmation] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeacherHelpdesk] ADD CONSTRAINT [PK_TeacherHelpdesk] PRIMARY KEY CLUSTERED ([TeacherHelpdeskId]) ON [PRIMARY]
GO
