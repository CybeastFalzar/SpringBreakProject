CREATE TABLE [Data].[Model]
(
[ModelID] [smallint] NOT NULL IDENTITY(1, 1),
[MakeID] [Udt].[ID] NULL,
[ModelName] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Data].[Model] ADD CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED ([ModelID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ModelName] ON [Data].[Model] ([ModelName]) ON [PRIMARY]
GO
ALTER TABLE [Data].[Model] ADD CONSTRAINT [FK_Model_Make] FOREIGN KEY ([MakeID]) REFERENCES [Data].[Make] ([MakeID])
GO
