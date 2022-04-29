SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Reference].[uvw_SalesText] AS
SELECT CountryName, MakeName, FORMAT(Cost, 'c') AS Cost, FORMAT(SalePrice, 'c') AS SalePrice
FROM Data.SalesByCountry
GO
