SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Reference].[uvw_MarketingInformation]
AS
SELECT C.CustomerID,
       C.CustomerName,
       C.Address1,
       C.Town,
       C.PostCode AS PostalCode,
       C.Country AS CustomerCountry,
       C.IsCreditRisk,
       C.IsReseller,
       SUM(S.TotalSalePrice) AS [Total Amount Purchased],
       CASE
           WHEN SUM(S.TotalSalePrice) <= 10000 THEN
               'None'
           WHEN SUM(S.TotalSalePrice) > 10000
                AND SUM(S.TotalSalePrice) < 50000 THEN
               'Some'
           WHEN SUM(S.TotalSalePrice) >= 50000
                AND SUM(S.TotalSalePrice) < 100000 THEN
               'Lots'
           WHEN SUM(S.TotalSalePrice) > 100000
                AND SUM(S.TotalSalePrice) < 1000000 THEN
               'Immense'
           ELSE
               'No Limit'
       END AS SpendCapacity
FROM Data.Customer AS C
    INNER JOIN Data.Sales AS S
        ON C.CustomerID = S.CustomerID
GROUP BY C.CustomerID,
         C.CustomerName,
         C.Address1,
         C.Town,
         C.PostCode,
         C.Country,
         C.IsReseller,
         C.IsCreditRisk;
GO
