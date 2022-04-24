CREATE TABLE [Data].[Country]
(
[CountryName] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountryISO2] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountryISO3] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SalesRegion] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountryFlag] [varbinary] (max) NULL,
[FlagFileName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FlagFileType] [nchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Data].[Country] ADD CONSTRAINT [CK_CountryISO2] CHECK ((len([CountryISO2])=(2)))
GO
ALTER TABLE [Data].[Country] ADD CONSTRAINT [CK_CountryISo3] CHECK ((len([CountryISO3])=(3)))
GO
CREATE NONCLUSTERED INDEX [UniqueCoutryNameISO2_idx] ON [Data].[Country] ([CountryISO2]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UniqueCoutryNameISO3_idx] ON [Data].[Country] ([CountryISO3]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UniqueCoutryName_idx] ON [Data].[Country] ([CountryName]) ON [PRIMARY]
GO
