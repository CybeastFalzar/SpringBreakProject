CREATE TABLE [dbo].[SalesDetails]
(
[SalesDetailsID] [Udt].[ID] NOT NULL IDENTITY(1, 1),
[SalesID] [Udt].[ID] NULL,
[LineItemNumber] [Udt].[LineItem] NULL,
[StockID] [Udt].[Stock] NULL,
[SalePrice] [Udt].[Price] NULL,
[LineItemDiscount] [Udt].[Price] NULL
) ON [PRIMARY]
GO
