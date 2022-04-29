CREATE TABLE [Data].[Sales]
(
[SalesID] [Udt].[ID] NOT NULL,
[CustomerID] [Udt].[ID] NULL,
[InvoiceNumber] [Udt].[InvoiceNumber] NULL,
[TotalSalePrice] [Udt].[Price] NULL,
[SaleDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Data].[Sales] ADD CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED ([SalesID]) ON [PRIMARY]
GO
