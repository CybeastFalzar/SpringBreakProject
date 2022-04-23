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
ALTER TABLE [Data].[SalesDetails] ADD CONSTRAINT [PK_SalesDetails] PRIMARY KEY CLUSTERED ([SalesDetailsID]) ON [PRIMARY]
GO
ALTER TABLE [Data].[SalesDetails] ADD CONSTRAINT [FK_SalesDetails_Sales] FOREIGN KEY ([SalesID]) REFERENCES [Data].[Sales] ([SalesID])
GO
ALTER TABLE [Data].[SalesDetails] ADD CONSTRAINT [FK_SalesDetails_Stock] FOREIGN KEY ([StockID]) REFERENCES [Data].[Stock] ([StockCode])
GO
