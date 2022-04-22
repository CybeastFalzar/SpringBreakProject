CREATE TABLE [Reference].[SalesBudgets]
(
[BudgetArea] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BudgetAmount] [money] NULL,
[BudgetYear] [int] NULL,
[DateUpdated] [datetime] NULL,
[Comments] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BudgetMonth] [tinyint] NULL
) ON [PRIMARY]
GO
