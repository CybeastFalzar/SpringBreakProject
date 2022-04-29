CREATE TABLE [Data].[Make]
(
[MakeID] [Udt].[ID] NOT NULL IDENTITY(1, 1),
[MakeName] [Udt].[CarName] NULL,
[MakeCountry] [Udt].[ISO3] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Data].[Make] ADD CONSTRAINT [PK_Make] PRIMARY KEY CLUSTERED ([MakeID]) ON [PRIMARY]
GO
