CREATE TABLE [Reference].[Budget]
(
[BudgetKey] [int] NOT NULL IDENTITY(1, 1),
[BudgetValue] [money] NULL,
[Year] [int] NULL,
[Month] [tinyint] NULL,
[BudgetDetail] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BudgetElement] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
