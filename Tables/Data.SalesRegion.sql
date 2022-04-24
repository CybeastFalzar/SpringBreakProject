CREATE TABLE [Data].[SalesRegion]
(
[SalesRegionId] [Udt].[SurrogateKeyInt] NOT NULL IDENTITY(1, 1),
[SalesRegion] [Udt].[SalesRegion] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Data].[SalesRegion] ADD CONSTRAINT [PK_SalesRegion] PRIMARY KEY CLUSTERED ([SalesRegionId]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UniqueSalesRegionName_idx] ON [Data].[SalesRegion] ([SalesRegion]) ON [PRIMARY]
GO
