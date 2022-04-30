SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Data].[LoadStockPrice] @UserAuthorizationKey AS INT
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    DECLARE @StartTime DATETIME2 = SYSDATETIME();
    EXEC ('
CREATE VIEW [Output].[uvw_StockPrice]
AS
SELECT DISTINCT
       Make.MakeName,
       Model.ModelName,
       FORMAT(ST.Cost, ''c'') AS Cost
FROM Data.Stock AS ST
    INNER JOIN Data.Model AS Model
        ON Model.ModelID = ST.ModelID
    INNER JOIN Data.Make AS Make
        ON Make.MakeID = Model.MakeID;
'        );

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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ST"
            Begin Extent = 
               Top = 6
               Left = 469
               Bottom = 136
               Right = 647
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Model"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 431
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Make"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
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
                                    @level0name = N'Output',
                                    @level1type = N'VIEW',
                                    @level1name = N'uvw_StockPrice';

    EXEC sys.sp_addextendedproperty @name = N'MS_DiagramPaneCount',
                                    @value = 1,
                                    @level0type = N'SCHEMA',
                                    @level0name = N'Output',
                                    @level1type = N'VIEW',
                                    @level1name = N'uvw_StockPrice';



 DECLARE @RowCount INT =
            (
                SELECT COUNT(*)FROM Output.uvw_StockPrice
            );
    DECLARE @EndTime DATETIME2 = SYSDATETIME();
    EXEC Process.usp_TrackWorkFlow @UserAuthorizationKey = @UserAuthorizationKey,
                                   @WorkFlowStepDescription = N'Create the Output.uvw_StockPrice View',
                                   @WorkFlowStepTableRowCount = @RowCount,
                                   @StartingDateTime = @StartTime,
                                   @EndingDateTime = @EndTime;


END;
GO
