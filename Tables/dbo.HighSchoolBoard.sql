CREATE TABLE [dbo].[HighSchoolBoard]
(
[HighSchoolBoardId] [int] NOT NULL IDENTITY(1, 1),
[HighSchoolBoardName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Active] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HighSchoolBoard] ADD CONSTRAINT [PK_HighSchoolBoard] PRIMARY KEY CLUSTERED ([HighSchoolBoardId]) ON [PRIMARY]
GO
