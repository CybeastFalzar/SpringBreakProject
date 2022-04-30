CREATE TABLE [Data].[Make]
(
[MakeID] [Udt].[ID] NOT NULL IDENTITY(1, 1),
[MakeName] [Udt].[CarName] NULL,
[MakeCountry] [Udt].[ISO3] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Data].[Make] ADD CONSTRAINT [CK_MakeCountry] CHECK (([MakeCountry] like '[A-Z][A-Z][A-Z]'))
GO
ALTER TABLE [Data].[Make] ADD CONSTRAINT [CK_MakeName] CHECK ((NOT [MakeName] like '%[^A-Z_ ]%'))
GO
ALTER TABLE [Data].[Make] ADD CONSTRAINT [PK_Make] PRIMARY KEY CLUSTERED ([MakeID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [MakeCountry] ON [Data].[Make] ([MakeCountry]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [MakeName] ON [Data].[Make] ([MakeName]) ON [PRIMARY]
GO
