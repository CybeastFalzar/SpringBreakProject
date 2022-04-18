CREATE TABLE [DataTransfer].[Sales2018]
(
[MakeName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModelName] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerName] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountryName] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cost] [money] NULL,
[RepairsCost] [money] NULL,
[PartsCost] [money] NULL,
[TransportInCost] [money] NULL,
[SalePrice] [numeric] (18, 2) NULL,
[SaleDate] [datetime] NULL
) ON [PRIMARY]
GO
