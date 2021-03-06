USE [master]
GO
/****** Object:  Database [Stock]    Script Date: 2018/7/12 10:02:00 ******/
CREATE DATABASE [Stock]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'stock', FILENAME = N'E:\MSSQL\DATA\stock.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'stock_log', FILENAME = N'E:\MSSQL\DATA\stock_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Stock] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Stock].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Stock] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Stock] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Stock] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Stock] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Stock] SET ARITHABORT OFF 
GO
ALTER DATABASE [Stock] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Stock] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Stock] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Stock] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Stock] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Stock] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Stock] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Stock] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Stock] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Stock] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Stock] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Stock] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Stock] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Stock] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Stock] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Stock] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Stock] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Stock] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Stock] SET RECOVERY FULL 
GO
ALTER DATABASE [Stock] SET  MULTI_USER 
GO
ALTER DATABASE [Stock] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Stock] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Stock] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Stock] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Stock', N'ON'
GO
USE [Stock]
GO
/****** Object:  Schema [m2ss]    Script Date: 2018/7/12 10:02:01 ******/
CREATE SCHEMA [m2ss]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2018/7/12 10:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(8,1) NOT NULL,
	[CName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_category_id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2018/7/12 10:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(5,1) NOT NULL,
	[CName] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](20) NULL,
	[Phone] [nvarchar](20) NULL,
 CONSTRAINT [PK_customer_id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Depot]    Script Date: 2018/7/12 10:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Depot](
	[Id] [int] IDENTITY(4,1) NOT NULL,
	[DName] [nvarchar](20) NOT NULL,
	[Phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_depot_id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Goods]    Script Date: 2018/7/12 10:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[Id] [int] IDENTITY(26,1) NOT NULL,
	[GoodsID] [nvarchar](10) NOT NULL,
	[GName] [nvarchar](20) NOT NULL,
	[UnitPrice] [decimal](8, 2) NOT NULL,
	[Manufacture] [nvarchar](20) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_goods_id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Instock]    Script Date: 2018/7/12 10:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instock](
	[Id] [int] IDENTITY(27,1) NOT NULL,
	[GoodsId] [int] NOT NULL,
	[DepotId] [int] NOT NULL,
	[InNum] [int] NOT NULL,
	[InDate] [datetime] NOT NULL,
	[ProviderId] [int] NOT NULL,
 CONSTRAINT [PK_instock_id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Outstock]    Script Date: 2018/7/12 10:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outstock](
	[Id] [int] IDENTITY(19,1) NOT NULL,
	[GoodsId] [int] NOT NULL,
	[DepotId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OutNum] [int] NOT NULL,
	[OutDate] [date] NOT NULL,
 CONSTRAINT [PK_outstock_id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Provider]    Script Date: 2018/7/12 10:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[Id] [int] IDENTITY(4,1) NOT NULL,
	[PName] [nvarchar](20) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_provider_id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StorageInfo]    Script Date: 2018/7/12 10:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageInfo](
	[Id] [int] IDENTITY(101,1) NOT NULL,
	[GoodsId] [int] NULL,
	[DepotId] [int] NULL,
	[StorageNum] [int] NULL,
 CONSTRAINT [PK_storage_info_storageID] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CName]) VALUES (2, N'冰箱')
INSERT [dbo].[Category] ([Id], [CName]) VALUES (5, N'电饭煲')
INSERT [dbo].[Category] ([Id], [CName]) VALUES (1, N'电视机')
INSERT [dbo].[Category] ([Id], [CName]) VALUES (6, N'豆浆机')
INSERT [dbo].[Category] ([Id], [CName]) VALUES (3, N'空调')
INSERT [dbo].[Category] ([Id], [CName]) VALUES (7, N'微波炉')
INSERT [dbo].[Category] ([Id], [CName]) VALUES (4, N'洗衣机')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [CName], [Address], [Phone]) VALUES (1, N'刘一鸣', N'北京市朝阳区新源南路14号', N'13901212345')
INSERT [dbo].[Customer] ([Id], [CName], [Address], [Phone]) VALUES (2, N'王传华', N'北京市东城区香河园路16 号', N'18674060972')
INSERT [dbo].[Customer] ([Id], [CName], [Address], [Phone]) VALUES (3, N'张洪涛', N'上海市徐汇区漕溪路126号', N'13818929999')
INSERT [dbo].[Customer] ([Id], [CName], [Address], [Phone]) VALUES (4, N'刘亚其', N'武汉市江岸区洞庭街67', N'18672791254')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Depot] ON 

INSERT [dbo].[Depot] ([Id], [DName], [Phone]) VALUES (1, N'仓库1', N'13612345678')
INSERT [dbo].[Depot] ([Id], [DName], [Phone]) VALUES (2, N'仓库2', N'13612345678')
INSERT [dbo].[Depot] ([Id], [DName], [Phone]) VALUES (3, N'仓库3', N'13612345678')
SET IDENTITY_INSERT [dbo].[Depot] OFF
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (2, N'DD002', N'创维55M6', CAST(3899.00 AS Decimal(8, 2)), N'创维', 1)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (3, N'DD003', N'创维43X5', CAST(2499.00 AS Decimal(8, 2)), N'创维', 1)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (4, N'DD004', N'海信LED55EC520UA', CAST(3999.00 AS Decimal(8, 2)), N'海信', 1)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (5, N'DD005', N'海信LED43EC291N', CAST(2198.00 AS Decimal(8, 2)), N'海信', 1)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (6, N'DB001', N'海尔BCD-452WDPF', CAST(3499.00 AS Decimal(8, 2)), N'海尔', 4)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (7, N'DB002', N'海尔BCD-201STPA', CAST(1399.00 AS Decimal(8, 2)), N'海尔', 4)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (8, N'DB003', N'容声BCD-236WD11NY', CAST(2799.00 AS Decimal(8, 2)), N'容声', 2)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (9, N'DB004', N'容声BCD-228D11SY', CAST(1599.00 AS Decimal(8, 2)), N'容声', 2)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (12, N'DB005', N'容声BCD-201E/A', CAST(1198.00 AS Decimal(8, 2)), N'容声', 2)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (13, N'DK001', N'美的KFR-35GW/WPAD3', CAST(2159.00 AS Decimal(8, 2)), N'美的', 2)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (14, N'DK002', N'美的KFR-51LW/WYAD2', CAST(4799.00 AS Decimal(8, 2)), N'美的', 2)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (15, N'DK003', N'美的KFR-32GW/WPAA3', CAST(2599.00 AS Decimal(8, 2)), N'美的', 2)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (16, N'DK004', N'美的KFR-23GW/WPAD3', CAST(2099.00 AS Decimal(8, 2)), N'美的', 2)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (17, N'DK005', N'格力KFR-32GW/32596', CAST(3199.00 AS Decimal(8, 2)), N'格力', 3)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (18, N'DK006', N'格力KFR-35GW/(35596)', CAST(3299.00 AS Decimal(8, 2)), N'格力', 3)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (19, N'DK007', N'志高NEW-GD9F1H3', CAST(1056.00 AS Decimal(8, 2)), N'志高', 3)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (20, N'DK008', N'志高NEW-LV18C1H3', CAST(4765.00 AS Decimal(8, 2)), N'志高', 3)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (21, N'DX001', N'西门子WS12M3600W', CAST(3478.00 AS Decimal(8, 2)), N'西门子', 4)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (22, N'DX002', N'西门子WM08E2C00W', CAST(2886.00 AS Decimal(8, 2)), N'西门子', 4)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (23, N'DX003', N'海尔XQB75-M1269S', CAST(1248.00 AS Decimal(8, 2)), N'海尔', 4)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (24, N'DX004', N'海尔EMS70BZ58W', CAST(2378.00 AS Decimal(8, 2)), N'海尔', 4)
INSERT [dbo].[Goods] ([Id], [GoodsID], [GName], [UnitPrice], [Manufacture], [CategoryId]) VALUES (25, N'DX005', N'海尔EG8012B29WA', CAST(2236.00 AS Decimal(8, 2)), N'海尔', 4)
SET IDENTITY_INSERT [dbo].[Goods] OFF
SET IDENTITY_INSERT [dbo].[Instock] ON 

INSERT [dbo].[Instock] ([Id], [GoodsId], [DepotId], [InNum], [InDate], [ProviderId]) VALUES (33, 2, 1, 30, CAST(0x0000A91A0118A954 AS DateTime), 2)
INSERT [dbo].[Instock] ([Id], [GoodsId], [DepotId], [InNum], [InDate], [ProviderId]) VALUES (34, 2, 1, 25, CAST(0x0000A91A0118F8BE AS DateTime), 2)
INSERT [dbo].[Instock] ([Id], [GoodsId], [DepotId], [InNum], [InDate], [ProviderId]) VALUES (35, 2, 1, 30, CAST(0x0000A91A0119E916 AS DateTime), 1)
INSERT [dbo].[Instock] ([Id], [GoodsId], [DepotId], [InNum], [InDate], [ProviderId]) VALUES (36, 4, 3, 10, CAST(0x0000A91A011C6EC5 AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Instock] OFF
SET IDENTITY_INSERT [dbo].[Outstock] ON 

INSERT [dbo].[Outstock] ([Id], [GoodsId], [DepotId], [CustomerId], [OutNum], [OutDate]) VALUES (22, 2, 1, 2, 80, CAST(0x753E0B00 AS Date))
INSERT [dbo].[Outstock] ([Id], [GoodsId], [DepotId], [CustomerId], [OutNum], [OutDate]) VALUES (23, 4, 3, 2, 10, CAST(0x753E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Outstock] OFF
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([Id], [PName], [Phone], [Address]) VALUES (1, N'甲供货商', N'18734568723', N'武汉')
INSERT [dbo].[Provider] ([Id], [PName], [Phone], [Address]) VALUES (2, N'乙供货商', N'13698981234', N'杭州')
INSERT [dbo].[Provider] ([Id], [PName], [Phone], [Address]) VALUES (3, N'丙供货商', N'13398125623', N'天津')
SET IDENTITY_INSERT [dbo].[Provider] OFF
SET IDENTITY_INSERT [dbo].[StorageInfo] ON 

INSERT [dbo].[StorageInfo] ([Id], [GoodsId], [DepotId], [StorageNum]) VALUES (105, 2, 1, 5)
INSERT [dbo].[StorageInfo] ([Id], [GoodsId], [DepotId], [StorageNum]) VALUES (106, 4, 3, 0)
SET IDENTITY_INSERT [dbo].[StorageInfo] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [category$uniqueCategory]    Script Date: 2018/7/12 10:02:01 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [category$uniqueCategory] UNIQUE NONCLUSTERED 
(
	[CName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [customer$uniqueCName]    Script Date: 2018/7/12 10:02:01 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [customer$uniqueCName] UNIQUE NONCLUSTERED 
(
	[CName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [depot$uniqueDName]    Script Date: 2018/7/12 10:02:01 ******/
ALTER TABLE [dbo].[Depot] ADD  CONSTRAINT [depot$uniqueDName] UNIQUE NONCLUSTERED 
(
	[DName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [goods$uniqueGoodsID]    Script Date: 2018/7/12 10:02:01 ******/
ALTER TABLE [dbo].[Goods] ADD  CONSTRAINT [goods$uniqueGoodsID] UNIQUE NONCLUSTERED 
(
	[GoodsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkCategory]    Script Date: 2018/7/12 10:02:01 ******/
CREATE NONCLUSTERED INDEX [fkCategory] ON [dbo].[Goods]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkDepot]    Script Date: 2018/7/12 10:02:01 ******/
CREATE NONCLUSTERED INDEX [fkDepot] ON [dbo].[Instock]
(
	[DepotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkGoodsID]    Script Date: 2018/7/12 10:02:01 ******/
CREATE NONCLUSTERED INDEX [fkGoodsID] ON [dbo].[Instock]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkProvider]    Script Date: 2018/7/12 10:02:01 ******/
CREATE NONCLUSTERED INDEX [fkProvider] ON [dbo].[Instock]
(
	[ProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkoutfk1]    Script Date: 2018/7/12 10:02:01 ******/
CREATE NONCLUSTERED INDEX [fkoutfk1] ON [dbo].[Outstock]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkoutfk2]    Script Date: 2018/7/12 10:02:01 ******/
CREATE NONCLUSTERED INDEX [fkoutfk2] ON [dbo].[Outstock]
(
	[DepotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkoutfk3]    Script Date: 2018/7/12 10:02:01 ******/
CREATE NONCLUSTERED INDEX [fkoutfk3] ON [dbo].[Outstock]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [pName]    Script Date: 2018/7/12 10:02:01 ******/
CREATE NONCLUSTERED INDEX [pName] ON [dbo].[Provider]
(
	[PName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_storage1]    Script Date: 2018/7/12 10:02:01 ******/
CREATE NONCLUSTERED INDEX [fk_storage1] ON [dbo].[StorageInfo]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_storage2]    Script Date: 2018/7/12 10:02:01 ******/
CREATE NONCLUSTERED INDEX [fk_storage2] ON [dbo].[StorageInfo]
(
	[DepotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT (NULL) FOR [Address]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT (NULL) FOR [Phone]
GO
ALTER TABLE [dbo].[Goods] ADD  CONSTRAINT [DF__goods__manufactu__182C9B23]  DEFAULT (NULL) FOR [Manufacture]
GO
ALTER TABLE [dbo].[Goods] ADD  CONSTRAINT [DF__goods__category__1920BF5C]  DEFAULT (NULL) FOR [CategoryId]
GO
ALTER TABLE [dbo].[Instock] ADD  CONSTRAINT [DF__instock__inNum__1BFD2C07]  DEFAULT (NULL) FOR [InNum]
GO
ALTER TABLE [dbo].[Instock] ADD  CONSTRAINT [DF__instock__inDate__1DE57479]  DEFAULT (NULL) FOR [InDate]
GO
ALTER TABLE [dbo].[Instock] ADD  CONSTRAINT [DF__instock__pName__1ED998B2]  DEFAULT (NULL) FOR [ProviderId]
GO
ALTER TABLE [dbo].[Outstock] ADD  CONSTRAINT [DF__outstock__cName__21B6055D]  DEFAULT (NULL) FOR [CustomerId]
GO
ALTER TABLE [dbo].[Outstock] ADD  CONSTRAINT [DF__outstock__outNum__22AA2996]  DEFAULT (NULL) FOR [OutNum]
GO
ALTER TABLE [dbo].[Outstock] ADD  CONSTRAINT [DF__outstock__outDat__239E4DCF]  DEFAULT (NULL) FOR [OutDate]
GO
ALTER TABLE [dbo].[Provider] ADD  DEFAULT (NULL) FOR [Phone]
GO
ALTER TABLE [dbo].[StorageInfo] ADD  CONSTRAINT [DF__storage_i__goods__29572725]  DEFAULT (NULL) FOR [GoodsId]
GO
ALTER TABLE [dbo].[StorageInfo] ADD  CONSTRAINT [DF__storage_i__depot__2A4B4B5E]  DEFAULT (NULL) FOR [DepotId]
GO
ALTER TABLE [dbo].[StorageInfo] ADD  CONSTRAINT [DF__storage_i__stora__2B3F6F97]  DEFAULT (NULL) FOR [StorageNum]
GO
ALTER TABLE [dbo].[Depot]  WITH CHECK ADD  CONSTRAINT [FK_Depot_Depot] FOREIGN KEY([Id])
REFERENCES [dbo].[Depot] ([Id])
GO
ALTER TABLE [dbo].[Depot] CHECK CONSTRAINT [FK_Depot_Depot]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Category]
GO
ALTER TABLE [dbo].[Instock]  WITH CHECK ADD  CONSTRAINT [FK_Instock_Depot] FOREIGN KEY([DepotId])
REFERENCES [dbo].[Depot] ([Id])
GO
ALTER TABLE [dbo].[Instock] CHECK CONSTRAINT [FK_Instock_Depot]
GO
ALTER TABLE [dbo].[Instock]  WITH CHECK ADD  CONSTRAINT [FK_Instock_Goods] FOREIGN KEY([GoodsId])
REFERENCES [dbo].[Goods] ([Id])
GO
ALTER TABLE [dbo].[Instock] CHECK CONSTRAINT [FK_Instock_Goods]
GO
ALTER TABLE [dbo].[Instock]  WITH CHECK ADD  CONSTRAINT [FK_Instock_Provider] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([Id])
GO
ALTER TABLE [dbo].[Instock] CHECK CONSTRAINT [FK_Instock_Provider]
GO
ALTER TABLE [dbo].[Outstock]  WITH CHECK ADD  CONSTRAINT [FK_Outstock_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Outstock] CHECK CONSTRAINT [FK_Outstock_Customer]
GO
ALTER TABLE [dbo].[Outstock]  WITH CHECK ADD  CONSTRAINT [FK_Outstock_Depot] FOREIGN KEY([DepotId])
REFERENCES [dbo].[Depot] ([Id])
GO
ALTER TABLE [dbo].[Outstock] CHECK CONSTRAINT [FK_Outstock_Depot]
GO
ALTER TABLE [dbo].[Outstock]  WITH CHECK ADD  CONSTRAINT [FK_Outstock_Goods] FOREIGN KEY([GoodsId])
REFERENCES [dbo].[Goods] ([Id])
GO
ALTER TABLE [dbo].[Outstock] CHECK CONSTRAINT [FK_Outstock_Goods]
GO
ALTER TABLE [dbo].[StorageInfo]  WITH CHECK ADD  CONSTRAINT [FK_StorageInfo_Depot] FOREIGN KEY([DepotId])
REFERENCES [dbo].[Depot] ([Id])
GO
ALTER TABLE [dbo].[StorageInfo] CHECK CONSTRAINT [FK_StorageInfo_Depot]
GO
ALTER TABLE [dbo].[StorageInfo]  WITH CHECK ADD  CONSTRAINT [FK_StorageInfo_Goods] FOREIGN KEY([GoodsId])
REFERENCES [dbo].[Goods] ([Id])
GO
ALTER TABLE [dbo].[StorageInfo] CHECK CONSTRAINT [FK_StorageInfo_Goods]
GO
ALTER TABLE [dbo].[StorageInfo]  WITH CHECK ADD  CONSTRAINT [FK_StorageInfo_StorageInfo] FOREIGN KEY([Id])
REFERENCES [dbo].[StorageInfo] ([Id])
GO
ALTER TABLE [dbo].[StorageInfo] CHECK CONSTRAINT [FK_StorageInfo_StorageInfo]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'stock.category' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'stock.customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'stock.depot' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Depot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'stock.goods' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Goods'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'stock.instock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Instock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'stock.outstock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Outstock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'stock.provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Provider'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'stock.storage_info' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StorageInfo'
GO
USE [master]
GO
ALTER DATABASE [Stock] SET  READ_WRITE 
GO
