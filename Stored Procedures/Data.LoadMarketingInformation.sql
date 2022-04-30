SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Data].[LoadMarketingInformation] @UserAuthorizationKey AS INT
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

	    DECLARE @StartTime DATETIME2 = SYSDATETIME();
    EXEC ('CREATE VIEW [Reference].[uvw_MarketingInformation]
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
               ''None''
           WHEN SUM(S.TotalSalePrice) > 10000
                AND SUM(S.TotalSalePrice) < 50000 THEN
               ''Some''
           WHEN SUM(S.TotalSalePrice) >= 50000
                AND SUM(S.TotalSalePrice) < 100000 THEN
               ''Lots''
           WHEN SUM(S.TotalSalePrice) > 100000
                AND SUM(S.TotalSalePrice) < 1000000 THEN
               ''Immense''
           ELSE
               ''No Limit''
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
'     );


    DECLARE @RowCount INT =
            (
                SELECT COUNT(*)FROM Reference.uvw_MarketingInformation
            );
    DECLARE @EndTime DATETIME2 = SYSDATETIME();
    EXEC Process.usp_TrackWorkFlow @UserAuthorizationKey = @UserAuthorizationKey,
                                   @WorkFlowStepDescription = N'Create the Reference.MarketingInformation View',
                                   @WorkFlowStepTableRowCount = @RowCount,
                                   @StartingDateTime = @StartTime,
                                   @EndingDateTime = @EndTime;


END;
GO
