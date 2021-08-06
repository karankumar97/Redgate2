CREATE TABLE [dbo].[contacts]
(
[Id] [uniqueidentifier] NOT NULL,
[DefenceForcesRank] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FullName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Email] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ContactNumber] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HowCanWeHelpYou] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDateAndTime] [datetime2] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[contacts] ADD CONSTRAINT [PK_contacts] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
