CREATE TABLE [Process].[WorkflowSteps]
(
[WorkFlowStepKey] [Udt].[ID] NOT NULL,
[WorkFlowStepDescription] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WorkFlowStepTableRowCount] [int] NULL,
[StartingDateTime] [datetime2] NULL,
[EndingDateTime] [datetime2] NULL,
[UserAuthorizationKey] [Udt].[ID] NULL
) ON [PRIMARY]
GO
