CREATE TABLE [Data].[SalesDetails]
(
[SalesDetailsID] [Udt].[ID] NULL,
[SalesID] [Udt].[ID] NULL,
[LineItemNumber] [Udt].[LineItem] NULL,
[StockID] [Udt].[Stock] NULL,
[SalePrice] [Udt].[Price] NULL,
[LineItemDiscount] [Udt].[Price] NULL CONSTRAINT [DF_SalesDetails_LineItemDiscount] DEFAULT ((0))
) ON [PRIMARY]
GO
