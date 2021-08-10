CREATE TABLE [dbo].[Student]
(
[ID] [int] NOT NULL,
[FirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gender] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Student] ADD CONSTRAINT [PK__Student__3214EC27DA7DB7D8] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
