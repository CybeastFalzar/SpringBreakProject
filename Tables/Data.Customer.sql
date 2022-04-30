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
ALTER TABLE [Data].[Customer] ADD CONSTRAINT [CK_Country] CHECK (([Country] like '[A-Z][A-Z]'))
GO
ALTER TABLE [Data].[Customer] ADD CONSTRAINT [CK_IsCreditRisk] CHECK (([IsCreditRisk] like '[A-Z][A-Z][A-Z]' OR [IsCreditRisk] like '[A-Z][A-Z]'))
GO
ALTER TABLE [Data].[Customer] ADD CONSTRAINT [CK_IsReseller] CHECK (([IsReseller] like '[A-Z][A-Z][A-Z]' OR [IsReseller] like '[A-Z][A-Z]'))
GO
ALTER TABLE [Data].[Customer] ADD CONSTRAINT [CK_PostCode] CHECK ((NOT [PostCode] like '%[^A-Z0-9-_ ]%'))
GO
ALTER TABLE [Data].[Customer] ADD CONSTRAINT [CK_Town] CHECK ((NOT [Town] like '%[^A-Z_ ]%'))
GO
ALTER TABLE [Data].[Customer] ADD CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([CustomerID]) ON [PRIMARY]
GO
