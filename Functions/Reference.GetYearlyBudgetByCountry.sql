SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [Reference].[GetYearlyBudgetByCountry]
(
@Year AS INT

)
RETURNS TABLE
AS
RETURN
	SELECT Year,
		   SUM(BudgetValue) AS Value,
		   BudgetDetail,
           BudgetElement 
	FROM Reference.uvw_Budget
	WHERE YEAR = @Year AND BudgetElement = 'Country'
	GROUP BY Year, BudgetDetail, BudgetElement
GO
