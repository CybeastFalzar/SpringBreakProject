CREATE TABLE [Reference].[StaffHierarchy]
(
[HierarchyReference] [sys].[hierarchyid] NULL,
[StaffID] [int] NOT NULL IDENTITY(1, 1),
[StaffName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ManagerID] [int] NULL,
[Department] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
