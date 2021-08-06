CREATE TABLE [dbo].[applicants]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[TeacherFullName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailAddress] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ContactPhoneNumber] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CityOfResidence] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PinCodeOfResidence] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EducationQualifications] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ExperienceInYears] [int] NOT NULL,
[RatePerClass] [int] NOT NULL,
[SubjectsYouWishToTeach] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PreferredLanguage] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AlternativeLanguage] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDateAndTime] [datetime2] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[applicants] ADD CONSTRAINT [PK_applicants] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
