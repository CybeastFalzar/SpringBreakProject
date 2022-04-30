CREATE TABLE [Data].[Employee]
(
[StaffID] [Udt].[ID] NOT NULL IDENTITY(1, 1),
[StaffName] [Udt].[Name] NULL,
[ManagerID] [Udt].[ID] NULL,
[Department] [Udt].[DepartmentName] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Data].[Employee] ADD CONSTRAINT [CK_Department] CHECK ((NOT [Department] like '%[^A-Z_ ]%'))
GO
ALTER TABLE [Data].[Employee] ADD CONSTRAINT [CK_ManagerID] CHECK ((NOT [StaffName] like '%[0-9]%'))
GO
ALTER TABLE [Data].[Employee] ADD CONSTRAINT [CK_StaffName] CHECK ((NOT [StaffName] like '%[^A-Z_ ]%'))
GO
ALTER TABLE [Data].[Employee] ADD CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED ([StaffID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Department] ON [Data].[Employee] ([Department]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ManagerID] ON [Data].[Employee] ([ManagerID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [StaffName] ON [Data].[Employee] ([StaffName]) ON [PRIMARY]
GO
