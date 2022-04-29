CREATE TABLE [Data].[Stock]
(
[StockCode] [Udt].[Stock] NULL CONSTRAINT [DF_Stock_StockCode] DEFAULT (newid()),
[ModelID] [Udt].[ID] NULL,
[Cost] [Udt].[Price] NULL,
[RepairsCost] [Udt].[Price] NULL,
[PartsCost] [Udt].[Price] NULL,
[TransportInCost] [Udt].[Price] NULL,
[IsRHD] [Udt].[BinaryChoice] NULL,
[Color] [Udt].[Name] NULL,
[DateBought] [date] NULL,
[TimeBought] [time] NULL
) ON [PRIMARY]
GO
