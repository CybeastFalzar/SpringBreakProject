CREATE TABLE [Data].[SalesDetails]
(
[SalesDetailsID] [int] NOT NULL IDENTITY(1, 1),
[SalesID] [int] NULL,
[LineItemNumber] [tinyint] NULL,
[StockID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SalePrice] [numeric] (18, 2) NULL,
[LineItemDiscount] [numeric] (18, 2) NULL
) ON [PRIMARY]
GO
