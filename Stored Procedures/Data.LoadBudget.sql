SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Data].[LoadBudget] @UserAuthorizationKey AS INT
AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    DECLARE @StartTime DATETIME2 = SYSDATETIME();

    EXEC ('
CREATE VIEW [Reference].[uvw_Budget]
AS
WITH C1 AS 
(
SELECT SUM(SalePrice) AS BudgetValue, YEAR(SaleDate) AS Year, MONTH(SaleDate) AS Month, BudgetDetail = N''TotalSales'', BudgetElement = N''Sales''
FROM Data.SalesByCountry
GROUP BY YEAR(SaleDate), MONTH(SaleDate)
),
C2 AS 
(
SELECT SUM(SalePrice) AS BudgetValue, YEAR(SaleDate) AS Year, Month(SaleDate) AS Month, BudgetDetail = Color, BudgetElement = ''Color''
FROM Data.SalesByCountry
GROUP BY YEAR(SaleDate), MONTH(SaleDate), Color
), 
C3 AS 
(

SELECT SUM(SalePrice) AS BudgetValue, YEAR(SaleDate) AS Year, MONTH(SaleDate) AS Month, BudgetDetail = CountryName, BudgetElement = ''Country''
FROM Data.SalesByCountry
GROUP BY YEAR(SaleDate),
         MONTH(SaleDate),
         CountryName
),
C4 AS(
SELECT SUM(SalePrice) AS BudgetValue, YEAR(SaleDate) AS Year, MONTH(SaleDate) AS Month, BudgetDetail = ''USA'', BudgetElement = ''Region''
From Data.SalesByCountry
Where CountryName = ''United States''
GROUP BY Year(SaleDate),
		 Month(SaleDate)
),
C5 AS(
SELECT  SUM(SalePrice) AS BudgetValue,YEAR(SaleDate) AS Year,  MONTH(SaleDate) AS Month,BudgetDetail = ''Europe'', BudgetElement = ''Region''
From Data.SalesByCountry
Where CountryName = ''France'' OR CountryName = ''Spain'' OR CountryName = ''Italy'' OR CountryName = ''Belgium'' OR CountryName = ''Germany'' OR CountryName = ''United Kingdom'' OR CountryName = ''Switzerland''
GROUP BY Year(SaleDate),
		 Month(SaleDate)
		 
)

SELECT * 
FROM C1
UNION ALL
SELECT *
FROM C2
UNION ALL
SELECT *
FROM C3
UNION ALL
SELECT *
FROM C4
UNION ALL
SELECT *
FROM C5
GO
 '       );
    EXEC sys.sp_addextendedproperty @name = N'MS_DiagramPane1',
                                    @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -576
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
'   ,
                                    @level0type = N'SCHEMA',
                                    @level0name = N'Reference',
                                    @level1type = N'VIEW',
                                    @level1name = N'uvw_Budget';


    EXEC sys.sp_addextendedproperty @name = N'MS_DiagramPaneCount',
                                    @value = 1,
                                    @level0type = N'SCHEMA',
                                    @level0name = N'Reference',
                                    @level1type = N'VIEW',
                                    @level1name = N'uvw_Budget';


    DECLARE @RowCount INT =
            (
                SELECT COUNT(*)FROM Reference.uvw_Budget
            );
    DECLARE @EndTime DATETIME2 = SYSDATETIME();
    EXEC Process.usp_TrackWorkFlow @UserAuthorizationKey = @UserAuthorizationKey,
                                   @WorkFlowStepDescription = N'Create the Reference.Budget View',
                                   @WorkFlowStepTableRowCount = @RowCount,
                                   @StartingDateTime = @StartTime,
                                   @EndingDateTime = @EndTime;



END;
GO
