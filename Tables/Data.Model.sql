CREATE TABLE [Data].[Model]
(
[ModelID] [smallint] NOT NULL IDENTITY(1, 1),
[MakeID] [smallint] NULL,
[ModelName] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModelVariant] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YearFirstProduced] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YearLastProduced] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
