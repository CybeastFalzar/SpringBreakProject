CREATE TABLE [Data].[Country]
(
[CountryName] [Udt].[CountryName] NULL,
[CountryISO2] [Udt].[ISO2] NULL,
[CountryISO3] [Udt].[ISO3] NULL,
[SalesRegion] [Udt].[ID] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Data].[Country] ADD CONSTRAINT [CK_CountryISO2] CHECK ((len([CountryISO2])=(2)))
GO
ALTER TABLE [Data].[Country] ADD CONSTRAINT [CK_CountryISo3] CHECK ((len([CountryISO3])=(3)))
GO
ALTER TABLE [Data].[Country] ADD CONSTRAINT [CK_CountryName] CHECK ((NOT [CountryName] like '%[^A-Z_ ]%'))
GO
CREATE NONCLUSTERED INDEX [UniqueCoutryNameISO2_idx] ON [Data].[Country] ([CountryISO2]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UniqueCoutryNameISO3_idx] ON [Data].[Country] ([CountryISO3]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UniqueCoutryName_idx] ON [Data].[Country] ([CountryName]) ON [PRIMARY]
GO
