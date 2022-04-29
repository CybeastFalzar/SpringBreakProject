CREATE TABLE [Data].[Customer]
(
[CustomerID] [int] NOT NULL IDENTITY(1, 1),
[CustomerName] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Town] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PostCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Country] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsReseller] [bit] NULL,
[IsCreditRisk] [bit] NULL
) ON [PRIMARY]
GO
