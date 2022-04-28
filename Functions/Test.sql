SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [Data].[GetSalesByYear]
(
    @year AS INT
)
RETURNS TABLE
AS
RETURN SELECT MakeName,
              ModelName,
              CustomerName,
              CountryName,
              Cost,
              RepairsCost,
              TransportInCost,
              SalePrice,
              SaleDate
       FROM Data.SalesByCountry
       WHERE YEAR(SaleDate) = @year;
GO
