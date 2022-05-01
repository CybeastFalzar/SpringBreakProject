CREATE TABLE [Data].[Sales]
(
[SalesID] [Udt].[ID] NOT NULL,
[CustomerID] [Udt].[ID] NULL,
[InvoiceNumber] [Udt].[InvoiceNumber] NULL,
[TotalSalePrice] [Udt].[Price] NULL,
[SaleDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Data].[Sales] ADD CONSTRAINT [CK_InvoiceNumber] CHECK ((NOT [InvoiceNumber] like '%[^A-Z0-9]%'))
GO
ALTER TABLE [Data].[Sales] ADD CONSTRAINT [CK_TotalSalePrice] CHECK ((NOT [TotalSalePrice] like '%[^0-9.]%'))
GO
ALTER TABLE [Data].[Sales] ADD CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED ([SalesID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [InvoiceNumber] ON [Data].[Sales] ([InvoiceNumber]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SaleDate] ON [Data].[Sales] ([SaleDate]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TotalSalePrice] ON [Data].[Sales] ([TotalSalePrice]) ON [PRIMARY]
GO
ALTER TABLE [Data].[Sales] ADD CONSTRAINT [FK_Sales_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [Data].[Customer] ([CustomerID])
GO
