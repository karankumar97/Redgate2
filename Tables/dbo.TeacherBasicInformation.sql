CREATE TABLE [dbo].[TeacherBasicInformation]
(
[TeacherId] [int] NOT NULL,
[Teacher_Name] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Contact_Telephone_Number] [bigint] NOT NULL,
[Email_Address] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[City] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Pincode] [int] NOT NULL,
[Active] [bit] NOT NULL,
[Qualifications] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Teaching_Interests] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Selling_Point] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Pricing_Structure] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Teaching_Experience] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Schedule] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDateAndTime] [datetime2] NOT NULL,
[UpdatedDateAndTime] [datetime2] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeacherBasicInformation] ADD CONSTRAINT [PK_TeacherBasicInformation] PRIMARY KEY CLUSTERED ([TeacherId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeacherBasicInformation] ADD CONSTRAINT [FK_TeacherBasicInformation_TeacherAuthenticationDetails_TeacherId] FOREIGN KEY ([TeacherId]) REFERENCES [dbo].[TeacherAuthenticationDetails] ([TeacherId]) ON DELETE CASCADE
GO
