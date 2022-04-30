SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Process].[LoadViews]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
TRUNCATE TABLE Process.WorkFlowSteps
ALTER SEQUENCE Process.WorkflowStepsKey RESTART WITH 1
    -- Insert statements for procedure here
EXEC Data.LoadBudget @UserAuthorizationKey = 12
EXEC Data.LoadForeignExchange @UserAuthorizationKey = 1
EXEC Data.LoadMarketingCategories @UserAuthorizationKey = 2
EXEC Data.LoadMarketingInformation @UserAuthorizationKey = 2
EXEC Data.LoadMarketingSalesInPounds @UserAuthorizationKey = 1
EXEC Data.LoadMarketingSalesText @UserAuthorizationKey = 1
EXEC Data.LoadStockPrice @UserAuthorizationKey = 1

INSERT INTO Process.WorkFlowSteps
(
		WorkFlowStepKey,
		WorkFlowStepDescription,
		WorkFlowStepTableRowCount,
		StartingDateTime,
		EndingDateTime,
		UserAuthorizationKey

)

VALUES 
(
	NEXT VALUE FOR Process.WorkflowStepsKey,
	'Reference.SalesCategories view was not completed',
	0,
	NULL,
	NULL,
	3

)


END
GO
