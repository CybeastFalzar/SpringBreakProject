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
