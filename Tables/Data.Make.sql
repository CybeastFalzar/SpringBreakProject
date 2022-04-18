CREATE TABLE [Data].[Make]
(
[MakeID] [smallint] NOT NULL IDENTITY(1, 1),
[MakeName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MakeCountry] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
