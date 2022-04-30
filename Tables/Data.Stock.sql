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
ALTER TABLE [Data].[Stock] ADD CONSTRAINT [CK_Color] CHECK ((NOT [Color] like '%[^A-Z_ ]%'))
GO
ALTER TABLE [Data].[Stock] ADD CONSTRAINT [CK_Cost] CHECK ((NOT [Cost] like '%[^0-9.]%'))
GO
ALTER TABLE [Data].[Stock] ADD CONSTRAINT [CK_DateBought] CHECK ((NOT [DateBought] like '%[^0-9-]%'))
GO
ALTER TABLE [Data].[Stock] ADD CONSTRAINT [CK_PartsCost] CHECK ((NOT [PartsCost] like '%[^0-9.]%'))
GO
ALTER TABLE [Data].[Stock] ADD CONSTRAINT [CK_RepairsCost] CHECK ((NOT [RepairsCost] like '%[^0-9.]%'))
GO
ALTER TABLE [Data].[Stock] ADD CONSTRAINT [CK_StockCode] CHECK ((NOT [StockCode] like '%[^A-Z0-9-]%'))
GO
