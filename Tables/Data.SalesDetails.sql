CREATE TABLE [Data].[SalesDetails]
(
[SalesDetailsID] [Udt].[ID] NOT NULL,
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
ALTER TABLE [Data].[SalesDetails] ADD CONSTRAINT [PK_SalesDetails] PRIMARY KEY CLUSTERED ([SalesDetailsID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [LineItemDiscount] ON [Data].[SalesDetails] ([LineItemDiscount]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SalePrice] ON [Data].[SalesDetails] ([SalePrice]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [StockID] ON [Data].[SalesDetails] ([StockID]) ON [PRIMARY]
GO
ALTER TABLE [Data].[SalesDetails] ADD CONSTRAINT [FK_SalesDetails_Sales] FOREIGN KEY ([SalesID]) REFERENCES [Data].[Sales] ([SalesID])
GO
