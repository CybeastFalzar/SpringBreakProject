CREATE TABLE [Data].[Customer]
(
[CustomerID] [Udt].[ID] NOT NULL IDENTITY(1, 1),
[CustomerName] [Udt].[Name] NULL,
[Address1] [Udt].[Address] NULL,
[Town] [Udt].[Address] NOT NULL,
[PostCode] [Udt].[PostCode] NULL,
[Country] [Udt].[ISO2] NULL,
[IsReseller] [Udt].[BinaryChoice] NULL,
[IsCreditRisk] [Udt].[BinaryChoice] NULL
) ON [PRIMARY]
GO
