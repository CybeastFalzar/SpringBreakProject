CREATE TABLE [Data].[Stock]
(
[StockCode] [Udt].[Stock] NOT NULL CONSTRAINT [DF_Stock_StockCode] DEFAULT (newid()),
[ModelID] [smallint] NULL,
[Cost] [money] NULL,
[RepairsCost] [money] NULL,
[PartsCost] [money] NULL,
[TransportInCost] [money] NULL,
[IsRHD] [bit] NULL,
[Color] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BuyerComments] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateBought] [date] NULL,
[TimeBought] [time] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Data].[Stock] ADD CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED ([StockCode]) ON [PRIMARY]
GO
