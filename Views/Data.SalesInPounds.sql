SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Data].[SalesInPounds] AS
SELECT MakeName, ModelName, ('£' + CAST( (SalePrice * 0.8) AS NVARCHAR(15))) AS SalesPrice
FROM Data.SalesByCountry
GO
