SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [Data].[LoadMarketingSalesText] @UserAuthorizationKey AS INT

AS
BEGIN
    DECLARE @StartTime DATETIME2 = SYSDATETIME();
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	EXEC('CREATE VIEW [Reference].[uvw_SalesText]
AS
SELECT CountryName,
       MakeName,
       FORMAT(Cost, ''c'') AS Cost,
       FORMAT(SalePrice, ''c'') AS SalePrice
FROM Data.SalesByCountry;')

 DECLARE @RowCount INT =
            (
                SELECT COUNT(*)FROM Reference.uvw_SalesText
            );
    DECLARE @EndTime DATETIME2 = SYSDATETIME();
    EXEC Process.usp_TrackWorkFlow @UserAuthorizationKey = @UserAuthorizationKey,
                                   @WorkFlowStepDescription = N'Create the Reference.SalesText View',
                                   @WorkFlowStepTableRowCount = @RowCount,
                                   @StartingDateTime = @StartTime,
                                   @EndingDateTime = @EndTime;


END
GO
