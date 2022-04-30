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
ALTER TABLE [Data].[SalesDetails] ADD CONSTRAINT [CK_SalePrice] CHECK ((NOT [SalePrice] like '%[^0-9.]%'))
GO
ALTER TABLE [Data].[SalesDetails] ADD CONSTRAINT [CK_Stock] CHECK ((NOT [StockID] like '%[^A-Z0-9-]%'))
GO
