SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [Data].[SalesByCountry]

AS

SELECT   
 CO.CountryName
,MK.MakeName
,MD.ModelName, ST.Cost
,ST.RepairsCost
,ST.PartsCost
,ST.TransportInCost
,ST.Color
,SD.SalePrice
,SD.LineItemDiscount
,SA.InvoiceNumber
,SA.SaleDate
,CS.CustomerName
,SD.SalesDetailsID

FROM     Data.Stock ST 
         INNER JOIN Data.Model MD ON ST.ModelID = MD.ModelID 
         INNER JOIN Data.Make MK ON MD.MakeID = MK.MakeID 
         INNER JOIN Data.SalesDetails SD ON ST.StockCode = SD.StockID 
         INNER JOIN Data.Sales SA ON SD.SalesID = SA.SalesID 
         INNER JOIN Data.Customer CS ON SA.CustomerID = CS.CustomerID 
         INNER JOIN Data.Country CO  ON CS.Country = CO.CountryISO2




GO
