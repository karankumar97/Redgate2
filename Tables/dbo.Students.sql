CREATE TABLE [dbo].[Students]
(
[StudentId] [int] NOT NULL IDENTITY(1, 1),
[StudentName] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ParentName] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailAddress] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PhoneNumber] [bigint] NOT NULL,
[City] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Pincode] [int] NOT NULL,
[HighSchoolBoardOrUniversity] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TuitionsEnquiry] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SuitableDatesAndTime] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDateAndTime] [datetime2] NOT NULL,
[PreferredLanguage] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Students] ADD CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED ([StudentId]) ON [PRIMARY]
GO
