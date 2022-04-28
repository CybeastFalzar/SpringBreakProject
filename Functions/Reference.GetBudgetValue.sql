SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [Reference].[GetBudgetValue]
(
 @Year AS INT, @Month AS INT, @BudgetElement AS NVARCHAR(50)

)
RETURNS TABLE
AS
RETURN
	SELECT * 
	FROM Reference.uvw_Budget
	WHERE Year = @Year AND MONTH = @Month  AND BudgetElement = @BudgetElement
GO
