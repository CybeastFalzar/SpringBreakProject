CREATE TABLE [Data].[Sales]
(
[SalesID] [int] NOT NULL,
[CustomerID] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InvoiceNumber] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TotalSalePrice] [numeric] (18, 2) NULL,
[SaleDate] [datetime] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [Data].[Sales] ADD CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED ([SalesID]) ON [PRIMARY]
GO
