SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [Reference].[GetYearlyBudgetByCategory]
(
 @BudgetDetail AS NVARCHAR(50)

)
RETURNS TABLE
AS
RETURN
	SELECT Year,
		   SUM(BudgetValue) AS Value,
		   BudgetDetail,
           BudgetElement 
	FROM Reference.uvw_Budget
	WHERE BudgetDetail = @BudgetDetail
	GROUP BY Year, BudgetDetail, BudgetElement
GO
