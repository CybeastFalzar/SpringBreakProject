SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [Data].[GetSalesByYear]
	(@year AS INT) RETURNS TABLE
AS 
RETURN 
	SELECT SalesID,
           CustomerID,
           InvoiceNumber,
           TotalSalePrice,
           SaleDate,
           ID	
	FROM Data.Sales
	WHERE YEAR(SaleDate) = @year
GO
