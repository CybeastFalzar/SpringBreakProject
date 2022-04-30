SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author: Videsh Narine
-- Create date: 4/30/22
-- Description:	Gets total execution time and
--				member execution time from 
--				WorkflowSteps table
-- =============================================
Create PROCEDURE [Process].[usp_TrackWorkFlow] 

	@WorkFlowStepDescription NVARCHAR (100),
	@WorkFlowStepTableRowCount INT,
	@StartingDateTime DATETIME2(7),
	@EndingDateTime DATETIME2(7),
	@UserAuthorizationKey INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	INSERT INTO [Process].[WorkflowSteps]
	(
		WorkFlowStepKey,
		WorkFlowStepDescription,
		WorkFlowStepTableRowCount,
		StartingDateTime,
		EndingDateTime,

		UserAuthorizationKey
		
	)

	VALUES (NEXT VALUE FOR Process.WorkflowStepsKey,
							@WorkFlowStepDescription,
							@WorkFlowStepTableRowCount,
							@StartingDateTime,
							@EndingDateTime,
							@UserAuthorizationKey);


END;
GO
