CREATE TABLE [Data].[Model]
(
[ModelID] [Udt].[ID] NOT NULL IDENTITY(1, 1),
[MakeID] [Udt].[ID] NULL,
[ModelName] [Udt].[Name] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Data].[Model] ADD CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED ([ModelID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ModelName] ON [Data].[Model] ([ModelName]) ON [PRIMARY]
GO
ALTER TABLE [Data].[Model] ADD CONSTRAINT [FK_Model_Make] FOREIGN KEY ([MakeID]) REFERENCES [Data].[Make] ([MakeID])
GO
